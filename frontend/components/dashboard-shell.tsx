"use client";

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

export type DashboardNavItemKey = "workspace" | "interview" | "history" | "pricing" | "settings";
export type DashboardTabKey = Exclude<DashboardNavItemKey, "pricing">;

type DashboardShellProps = {
  activeItem: DashboardNavItemKey;
  onTabSelect?: (tab: DashboardTabKey) => void;
  children: React.ReactNode;
};

const navItems: Array<{
  key: DashboardNavItemKey;
  label: string;
  href: string;
}> = [
  { key: "workspace", label: "Workspace", href: "/dashboard" },
  { key: "interview", label: "Interview", href: "/dashboard#interview" },
  { key: "history", label: "History", href: "/dashboard#history" },
  { key: "pricing", label: "Pricing", href: "/dashboard/pricing" },
  { key: "settings", label: "Settings", href: "/dashboard#settings" },
];

export function DashboardShell({ activeItem, onTabSelect, children }: DashboardShellProps) {
  return (
    <section className="mx-auto max-w-7xl">
      <div className="flex flex-col gap-6 lg:flex-row">
        <aside className="w-full rounded-[30px] border border-slate-200 bg-white/90 p-4 shadow-[0_18px_40px_-28px_rgba(15,23,42,0.45)] dark:border-white/10 dark:bg-slate-950/70 lg:sticky lg:top-24 lg:w-64 lg:self-start">
          <div className="px-2">
            <p className="text-xs font-semibold uppercase tracking-[0.22em] text-slate-500 dark:text-slate-400">
              Workspace
            </p>
            <p className="mt-3 text-2xl font-semibold text-[var(--heading)] dark:text-white">InterviewOS</p>
          </div>

          <nav className="mt-6 grid gap-2">
            {navItems.map((item) => {
              const isActive = item.key === activeItem;
              const className = cn(
                "h-12 w-full justify-start rounded-[18px] px-4 text-sm font-medium transition-all",
                isActive && "shadow-[0_14px_30px_-20px_rgba(37,99,235,0.55)]",
              );

              if (item.key !== "pricing" && onTabSelect) {
                const tabKey = item.key as DashboardTabKey;

                return (
                  <Button
                    key={item.key}
                    variant={isActive ? "default" : "ghost"}
                    className={className}
                    onClick={() => onTabSelect(tabKey)}
                  >
                    {item.label}
                  </Button>
                );
              }

              return (
                <Button key={item.key} asChild variant={isActive ? "default" : "ghost"} className={className}>
                  <Link href={item.href}>{item.label}</Link>
                </Button>
              );
            })}
          </nav>
        </aside>

        <main className="min-w-0 flex-1">{children}</main>
      </div>
    </section>
  );
}
