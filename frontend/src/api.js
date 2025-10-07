//API utility for backend communication

const BASE = process.env.REACT_APP_API_URL || "http://localhost:8000";

export async function fetchTasks() {
  const res = await fetch(`${BASE}/tasks`);
  if (!res.ok) throw new Error("Failed to fetch");
  return res.json();
}

export async function createTask(payload) {
  const res = await fetch(`${BASE}/tasks`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    throw new Error(err.detail || "Create failed");
  }
  return res.json();
}

export async function markDone(id) {
  const res = await fetch(`${BASE}/tasks/${id}/done`, {
    method: "POST",
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    throw new Error(err.detail || "Mark failed");
  }
}
