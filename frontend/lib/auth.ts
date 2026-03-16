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

export function isExplicitAuthFailure(status: number, payload?: Record<string, unknown> | null) {
  if (status !== 401) {
    return false;
  }

  const message = typeof payload?.message === "string" ? payload.message : undefined;
  const error = typeof payload?.error === "string" ? payload.error : undefined;

  return message === "Unauthorized" || error === "UNAUTHORIZED";
}
