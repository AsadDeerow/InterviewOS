"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";

export function AuthNavLinks() {
  const pathname = usePathname();
  const isLoginActive = pathname === "/login";
  const isRegisterActive = pathname === "/register";

  return (
    <div className="flex items-center gap-1 rounded-[12px] border border-slate-200 bg-slate-50/90 p-1 dark:border-white/10 dark:bg-white/5">
      <Link
        href="/login"
        className={cn(
          "rounded-[10px] px-3 py-2 font-medium transition",
          isLoginActive
            ? "bg-[var(--brand-primary)] text-white shadow-[0_8px_20px_rgba(15,23,42,0.12)] hover:bg-[var(--brand-primary-hover)] dark:shadow-[0_8px_20px_rgba(59,91,204,0.28)]"
            : "text-[var(--foreground)] hover:bg-white hover:text-[var(--heading)] dark:text-[#cbd5e1] dark:hover:bg-white/10 dark:hover:text-[#f8fafc]"
        )}
      >
        Login
      </Link>
      <Link
        href="/register"
        className={cn(
          "rounded-[10px] px-3 py-2 font-medium transition",
          isRegisterActive
            ? "bg-[var(--brand-primary)] text-white shadow-[0_8px_20px_rgba(15,23,42,0.12)] hover:bg-[var(--brand-primary-hover)] dark:shadow-[0_8px_20px_rgba(59,91,204,0.28)]"
            : "text-[var(--foreground)] hover:bg-white hover:text-[var(--heading)] dark:text-[#cbd5e1] dark:hover:bg-white/10 dark:hover:text-[#f8fafc]"
        )}
      >
        Register
      </Link>
    </div>
  );
}
