# Todo App - React + FastAPI + MySQL (Docker)

## Overview
SPA that allows creating todo tasks (title + description), shows most recent 5 tasks, and marking tasks as done (completed tasks are hidden).

This implementation follows the assessment specification.

## Requirements
- Docker & docker-compose

## Run
1. Clone repo
2. From repo root:
   docker-compose up --build

- Frontend: http://localhost:3000
- Backend API docs (FastAPI): http://localhost:8000/docs

## Tests
### Backend
Inside backend container or locally with Python and deps:
pytest backend/tests

### Frontend
From frontend dir:
npm test

## Notes
- DB credentials are in docker-compose for simplicity. Change env vars if required.
- The `task` table columns: id, title, description, created_at, completed, completed_at.
"# to_do_app" 
