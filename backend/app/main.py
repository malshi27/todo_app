from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from . import database, models, schemas, crud

# Create database tables (auto-create if not exists)
models.Base.metadata.create_all(bind=database.engine)

app = FastAPI(title="Todo App API")

# ===== CORS SETTINGS =====
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # React frontend origin
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ===== Database Dependency =====
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

# ===== Root Endpoint =====
@app.get("/")
def root():
    return {"message": "Todo App API is running"}

# ===== Create a Task =====
@app.post("/tasks", response_model=schemas.TaskOut)
def create_task(task_in: schemas.TaskCreate, db: Session = Depends(get_db)):
    try:
        if not task_in.title or task_in.title.strip() == "":
            raise HTTPException(status_code=400, detail="Title required")
        return crud.create_task(db, task_in)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# ===== List Tasks =====
@app.get("/tasks", response_model=list[schemas.TaskOut])
def list_tasks(db: Session = Depends(get_db)):
    try:
        return crud.get_recent_tasks(db, limit=5)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# ===== Mark Task as Done =====
@app.post("/tasks/{task_id}/done", status_code=204)
def mark_done(task_id: int, db: Session = Depends(get_db)):
    try:
        task = crud.mark_task_done(db, task_id)
        if not task:
            raise HTTPException(status_code=404, detail="Task not found")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
