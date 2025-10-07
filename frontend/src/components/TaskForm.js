//TaskForm component for adding tasks
import React, { useState } from "react";
import "./styles.css";

export default function TaskForm({ onCreated }) {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [loading, setLoading] = useState(false);

  const submit = async (e) => {
    e.preventDefault();
    if (!title.trim()) return alert("Title required");
    setLoading(true);
    await onCreated({ title, description });
    setTitle("");
    setDescription("");
    setLoading(false);
  };

  return (
    <form className="task-form" onSubmit={submit}>
      <h2 className="form-title">Add New Task</h2>

      <div className="form-group">
        <input
          className="form-input"
          type="text"
          placeholder="Title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />
      </div>

      <div className="form-group">
        <textarea
          className="form-textarea"
          placeholder="Description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
      </div>

      <div className="form-group">
        <button className="form-button" type="submit" disabled={loading}>
          {loading ? "Saving..." : "Add Task"}
        </button>
      </div>
    </form>
  );
}
