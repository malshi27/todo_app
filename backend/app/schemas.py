#Pydantic schemas for request and response validation

from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class TaskCreate(BaseModel):
    title: str
    description: Optional[str] = None

class TaskOut(BaseModel):
    id: int
    title: str
    description: Optional[str] = None
    created_at: datetime
    completed: bool
    completed_at: Optional[datetime] = None

    class Config:
        orm_mode = True
