import * as React from "react";
import { cn } from "@/lib/utils";

type AlertVariant = "default" | "destructive" | "success";

const variantClasses: Record<AlertVariant, string> = {
  default: "border-slate-200 bg-slate-50 text-slate-800 dark:border-slate-700 dark:bg-slate-800 dark:text-slate-200",
  destructive: "border-red-200 bg-red-50 text-red-700 dark:border-red-900 dark:bg-red-950/50 dark:text-red-200",
  success: "border-emerald-200 bg-emerald-50 text-emerald-700 dark:border-emerald-900 dark:bg-emerald-950/50 dark:text-emerald-200",
};

function Alert({
  className,
  variant = "default",
  ...props
}: React.HTMLAttributes<HTMLDivElement> & { variant?: AlertVariant }) {
  return (
    <div
      role="alert"
      className={cn("rounded-lg border px-4 py-3 text-sm", variantClasses[variant], className)}
      {...props}
    />
  );
}

export { Alert };
