const CSRF_COOKIE_NAME = "XSRF-TOKEN";
const CSRF_HEADER_NAME = "X-XSRF-TOKEN";

type CsrfResponse = {
  token?: string;
};

function readCookie(name: string): string | null {
  if (typeof document === "undefined") {
    return null;
  }

  const prefix = `${name}=`;
  const cookies = document.cookie.split("; ");

  for (const cookie of cookies) {
    if (cookie.startsWith(prefix)) {
      return decodeURIComponent(cookie.slice(prefix.length));
    }
  }

  return null;
}

async function ensureCsrfToken(apiBase: string): Promise<string> {
  const existingToken = readCookie(CSRF_COOKIE_NAME);
  if (existingToken) {
    return existingToken;
  }

  const res = await fetch(`${apiBase}/api/auth/csrf`, {
    method: "GET",
    credentials: "include",
  });

  if (!res.ok) {
    throw new Error("Could not initialize CSRF protection.");
  }

  const cookieToken = readCookie(CSRF_COOKIE_NAME);
  if (cookieToken) {
    return cookieToken;
  }

  let data: CsrfResponse = {};
  try {
    data = (await res.json()) as CsrfResponse;
  } catch {
    data = {};
  }

  if (!data.token) {
    throw new Error("CSRF token missing from response.");
  }

  return data.token;
}

export async function fetchWithCsrf(apiBase: string, input: string, init: RequestInit = {}) {
  const method = (init.method ?? "GET").toUpperCase();
  const headers = new Headers(init.headers);

  if (!["GET", "HEAD", "OPTIONS"].includes(method)) {
    const csrfToken = await ensureCsrfToken(apiBase);
    headers.set(CSRF_HEADER_NAME, csrfToken);
  }

  return fetch(input, {
    ...init,
    credentials: "include",
    headers,
  });
}
