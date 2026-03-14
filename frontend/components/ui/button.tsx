import * as React from "react";
import { cn } from "@/lib/utils";
import { Slot } from "@/components/ui/slot";

type ButtonVariant = "default" | "secondary" | "ghost" | "outline" | "destructive";
type ButtonSize = "default" | "sm" | "lg" | "icon";

const variantClasses: Record<ButtonVariant, string> = {
  default:
    "bg-[var(--brand-primary)] text-white shadow-sm hover:bg-[var(--brand-primary-hover)] focus-visible:outline-primary-400",
  secondary:
    "bg-primary-50 text-primary-900 hover:bg-primary-100 focus-visible:outline-primary-400 dark:bg-primary-950 dark:text-primary-100 dark:hover:bg-primary-900",
  ghost:
    "text-[var(--foreground)] hover:bg-primary-50 hover:text-[var(--heading)] focus-visible:outline-primary-400 dark:text-slate-200 dark:hover:bg-slate-800 dark:hover:text-white",
  outline:
    "border border-primary-200 bg-white text-[var(--foreground)] hover:bg-primary-50 hover:text-[var(--heading)] focus-visible:outline-primary-400 dark:border-slate-600 dark:bg-slate-900 dark:text-slate-100 dark:hover:bg-slate-800",
  destructive:
    "bg-red-600 text-white hover:bg-red-500 focus-visible:outline-red-400",
};

const sizeClasses: Record<ButtonSize, string> = {
  default: "h-10 px-4 py-2",
  sm: "h-9 rounded-md px-3",
  lg: "h-11 rounded-md px-8",
  icon: "h-10 w-10",
};

export type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: ButtonVariant;
  size?: ButtonSize;
  asChild?: boolean;
};

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = "default", size = "default", type = "button", asChild = false, ...props }, ref) => {
    const classes = cn(
      "inline-flex items-center justify-center gap-2 rounded-lg text-sm font-medium transition-colors disabled:pointer-events-none disabled:opacity-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2",
      variantClasses[variant],
      sizeClasses[size],
      className
    );

    if (asChild) {
      return <Slot className={classes} ref={ref as React.Ref<HTMLElement>} {...props} />;
    }

    return (
      <button
        type={type}
        className={classes}
        ref={ref}
        {...props}
      />
    );
  }
);
Button.displayName = "Button";

export { Button };
