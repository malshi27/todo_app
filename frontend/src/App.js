import React, { useEffect, useState } from "react";
import { fetchTasks, createTask, markDone } from "./api";
import TaskForm from "./components/TaskForm";
import TaskList from "./components/TaskList";
import "./components/styles.css";

export default function App() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(false);

  // Load tasks from backend
  const load = async () => {
    setLoading(true);
    try {
      const data = await fetchTasks();
      setTasks(data);
    } catch (e) {
      console.error(e);
      alert("Failed to load tasks");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, []);

  // Create new task
  const handleCreate = async (payload) => {
    await createTask(payload);
    await load();
  };

  // Mark task as done
  const handleDone = async (id) => {
    if (!window.confirm("Mark done?")) return;
    await markDone(id);
    await load();
  };

  return (
    <div className="app-container">
      <h2 className="app-title">To do App</h2>

     <div className="task-container">
  <div className="task-left">
    <TaskForm onCreated={handleCreate} />
  </div>

  <div className="task-divider"></div> {/* <-- Vertical line */}

  <div className="task-right">
          {loading ? (
            <div className="loading-text">Loading...</div>
          ) : (
            <TaskList tasks={tasks} onDone={handleDone} />
          )}
        </div>
      </div>
    </div>
  );
}
