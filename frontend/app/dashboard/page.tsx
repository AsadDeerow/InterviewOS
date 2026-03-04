"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

export default function DashboardPage() {
  const router = useRouter();

  const [loading, setLoading] = useState(true);
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  function handleLogout() {
    localStorage.removeItem("token");
    router.push("/login");
  }

  useEffect(() => {
    async function loadDashboard() {
      const token = localStorage.getItem("token");

      if (!token) {
        router.push("/login");
        return;
      }

      try {
        const res = await fetch(`${API_BASE}/api/health`, {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (res.status === 401) {
          localStorage.removeItem("token");
          router.push("/login");
          return;
        }

        if (!res.ok) {
          setError("Something went wrong. Please try again.");
          return;
        }

        const text = await res.text();
        let parsedMessage = "";

        try {
          const json = JSON.parse(text) as { message?: string };
          parsedMessage = json.message ?? "Welcome to your dashboard.";
        } catch {
          parsedMessage = text;
        }

        setMessage(parsedMessage);
      } catch {
        setError("Something went wrong. Please try again.");
      } finally {
        setLoading(false);
      }
    }

    loadDashboard();
  }, [router]);

  if (loading) {
    return (
      <section className="mx-auto max-w-2xl">
        <Card>
          <CardHeader>
            <CardTitle>Dashboard</CardTitle>
            <CardDescription>Loading your session...</CardDescription>
          </CardHeader>
        </Card>
      </section>
    );
  }

  return (
    <section className="mx-auto max-w-3xl">
      <Card>
        <CardHeader className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <CardTitle>Dashboard</CardTitle>
            <CardDescription>Your authenticated workspace is active.</CardDescription>
          </div>
          <Button variant="outline" onClick={handleLogout}>
            Logout
          </Button>
        </CardHeader>

        <CardContent className="space-y-4">
          {error && <Alert variant="destructive">{error}</Alert>}

          {!error && (
            <>
              <Alert variant="success">You are authenticated.</Alert>
              <Alert>{message}</Alert>
            </>
          )}
        </CardContent>
      </Card>
    </section>
  );
}
