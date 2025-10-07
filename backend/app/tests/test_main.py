import pytest
from fastapi.testclient import TestClient
from app.main import app
from app import database, models
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# use an in-memory sqlite for tests
SQLALCHEMY_TEST_URL = "sqlite:///:memory:"
engine = create_engine(SQLALCHEMY_TEST_URL, connect_args={"check_same_thread": False})
TestingSessionLocal = sessionmaker(bind=engine)

models.Base.metadata.create_all(bind=engine)

@pytest.fixture
def client(monkeypatch):
    def override_get_db():
        db = TestingSessionLocal()
        try:
            yield db
        finally:
            db.close()

    monkeypatch.setattr("app.main.get_db", override_get_db)
    with TestClient(app) as c:
        yield c

def test_create_and_list_and_done(client):
    # create 6 tasks
    for i in range(6):
        r = client.post("/tasks", json={"title": f"Task {i}", "description": f"desc {i}"})
        assert r.status_code == 200

    r = client.get("/tasks")
    assert r.status_code == 200
    tasks = r.json()
    # only 5 latest returned
    assert len(tasks) == 5
    latest_task_id = tasks[0]["id"]

    # mark latest done
    r = client.post(f"/tasks/{latest_task_id}/done")
    assert r.status_code == 204

    r = client.get("/tasks")
    assert len(r.json()) == 5  # still 5, because one of the 5 got removed and replaced by previous 6th
