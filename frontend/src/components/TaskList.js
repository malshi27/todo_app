//Tasklist component for adding tasks
import React from "react";
import "./styles.css";

export default function TaskList({ tasks, onDone }) {
  if (!tasks.length) return <div className="no-tasks">No tasks</div>;

  return (
    <div className="task-list">
      {tasks.map((t) => (
        <div key={t.id} className="task-card">
          <div className="task-content">
            <h4 className="task-title">{t.title}</h4>
            {t.description && <p className="task-desc">{t.description}</p>}
          </div>
          <div className="task-actions">
            <button className="done-button" onClick={() => onDone(t.id)}>
              Done
            </button>
          </div>
        </div>
      ))}
    </div>
  );
}
