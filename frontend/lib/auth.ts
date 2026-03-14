export function getStoredToken() {
  if (typeof window === "undefined") {
    return null;
  }

  return localStorage.getItem("token") ?? sessionStorage.getItem("token");
}

export function clearStoredToken() {
  if (typeof window === "undefined") {
    return;
  }

  localStorage.removeItem("token");
  sessionStorage.removeItem("token");
}
