from sqlalchemy.orm import Session
from . import models, schemas
from datetime import datetime

def create_task(db: Session, task_in: schemas.TaskCreate):
    db_task = models.Task(title=task_in.title, description=task_in.description)
    db.add(db_task)
    db.commit()
    db.refresh(db_task)
    return db_task

def get_recent_tasks(db: Session, limit: int = 5):
    return db.query(models.Task).filter(models.Task.completed == False).order_by(models.Task.created_at.desc()).limit(limit).all()

def mark_task_done(db: Session, task_id: int):
    task = db.query(models.Task).filter(models.Task.id == task_id).first()
    if not task:
        return None
    task.completed = True
    task.completed_at = datetime.utcnow()
    db.commit()
    return task
