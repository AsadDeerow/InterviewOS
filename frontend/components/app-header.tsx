"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { usePathname, useRouter } from "next/navigation";
import { AuthNavLinks } from "@/components/auth-nav-links";
import { ThemeToggle } from "@/components/theme-toggle";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { fetchWithCsrf } from "@/lib/csrf";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;
const publicRoutes = new Set(["/", "/login", "/register"]);

export function AppHeader() {
  const pathname = usePathname();
  const router = useRouter();
  const [isVisible, setIsVisible] = useState(true);
  const [loggingOut, setLoggingOut] = useState(false);

  useEffect(() => {
    let lastScrollY = window.scrollY;

    function handleScroll() {
      const currentScrollY = window.scrollY;

      if (currentScrollY < 24) {
        setIsVisible(true);
      } else if (currentScrollY > lastScrollY + 8) {
        setIsVisible(false);
      } else if (currentScrollY < lastScrollY - 8) {
        setIsVisible(true);
      }

      lastScrollY = currentScrollY;
    }

    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const showAuthLinks = publicRoutes.has(pathname);
  const showLogout = !showAuthLinks;

  async function handleLogout() {
    setLoggingOut(true);

    try {
      await fetchWithCsrf(API_BASE, `${API_BASE}/api/auth/logout`, {
        method: "POST",
      });
    } finally {
      router.push("/login");
      router.refresh();
      setLoggingOut(false);
    }
  }

  return (
    <header
      className={cn(
        "fixed inset-x-0 top-0 z-30 border-b border-slate-200/80 bg-white/90 backdrop-blur-md transition-transform duration-300 dark:border-white/10 dark:bg-[#0f172a]/90",
        isVisible ? "translate-y-0" : "-translate-y-full"
      )}
    >
      <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-4 py-4 sm:px-6">
        <Link href="/" className="group flex items-center gap-2">
          <span className="h-2.5 w-2.5 rounded-full bg-[var(--brand-primary)] shadow-[0_0_12px_rgba(107,114,128,0.35)] transition group-hover:scale-110 dark:bg-[#3b82f6] dark:shadow-[0_0_18px_rgba(59,130,246,0.45)]" />
          <span className="text-xl font-semibold tracking-tight text-[var(--heading)] dark:text-[var(--heading)]">InterviewOS</span>
          <span className="hidden rounded-full border border-slate-300 px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-[var(--muted-foreground)] dark:border-white/10 dark:text-[var(--muted-foreground)] sm:inline-block">
            beta
          </span>
        </Link>

        <nav className="flex items-center gap-3 text-sm">
          {showAuthLinks ? <AuthNavLinks /> : null}
          {showLogout ? (
            <Button variant="outline" onClick={handleLogout} disabled={loggingOut}>
              {loggingOut ? "Logging out..." : "Logout"}
            </Button>
          ) : null}
          <ThemeToggle />
        </nav>
      </div>
    </header>
  );
}
