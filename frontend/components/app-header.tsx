"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { usePathname, useRouter } from "next/navigation";
import { AuthNavLinks } from "@/components/auth-nav-links";
import { ThemeToggle } from "@/components/theme-toggle";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { LogOut } from "lucide-react";

const publicRoutes = new Set(["/", "/login", "/register", "/terms", "/privacy"]);

export function AppHeader() {
  const pathname = usePathname();
  const router = useRouter();
  const [isVisible, setIsVisible] = useState(true);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    let lastScrollY = window.scrollY;

    function handleScroll() {
      const currentScrollY = window.scrollY;

      setScrolled(currentScrollY > 8);

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

  function handleLogout() {
    localStorage.removeItem("token");
    sessionStorage.removeItem("token");
    router.push("/login");
    router.refresh();
  }

  return (
    <header
      className={cn(
        "fixed inset-x-0 top-0 z-30 flex justify-center px-4 transition-all duration-300 sm:px-6",
        isVisible ? "translate-y-0" : "-translate-y-[calc(100%+16px)]",
        scrolled ? "pt-3" : "pt-4",
      )}
    >
      <div
        className={cn(
          "flex w-full max-w-5xl items-center justify-between rounded-2xl px-5 py-3 transition-all duration-300",
          scrolled
            ? "border border-slate-200/60 bg-white/80 shadow-[0_4px_20px_-4px_rgba(15,23,42,0.08)] backdrop-blur-xl dark:border-white/10 dark:bg-[#0f172a]/80 dark:shadow-[0_4px_20px_-4px_rgba(0,0,0,0.3)]"
            : "bg-transparent",
        )}
      >
        <Link href="/" className="group flex items-center gap-2.5">
          <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-[var(--brand-primary)] dark:bg-[#3b5bcc]">
            <span className="text-xs font-bold text-white">IO</span>
          </span>
          <span className="text-[15px] font-semibold tracking-tight text-[var(--heading)] dark:text-[var(--heading)]">
            InterviewOS
          </span>
          <span className="hidden rounded-full border border-slate-300 px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-[var(--muted-foreground)] dark:border-white/10 dark:text-[var(--muted-foreground)] sm:inline-block">
            beta
          </span>
        </Link>

        <nav className="flex items-center gap-2">
          {showAuthLinks ? <AuthNavLinks /> : null}
          {showLogout ? (
            <Button
              variant="ghost"
              size="sm"
              onClick={handleLogout}
              className="gap-1.5 text-xs text-[var(--muted-foreground)] hover:text-[var(--heading)]"
            >
              <LogOut className="h-3.5 w-3.5" />
              Logout
            </Button>
          ) : null}
          <ThemeToggle />
        </nav>
      </div>
    </header>
  );
}
