import * as React from "react";
import { cn } from "@/lib/utils";

type SlotProps = React.HTMLAttributes<HTMLElement> & {
  children?: React.ReactNode;
};

const Slot = React.forwardRef<HTMLElement, SlotProps>(({ children, className, ...props }, ref) => {
  if (!React.isValidElement(children)) {
    return null;
  }

  const child = children as React.ReactElement<{ className?: string; ref?: React.Ref<HTMLElement> }>;
  const childProps = child.props as Record<string, unknown> & { className?: string };

  return React.cloneElement(child, {
    ...props,
    ...childProps,
    className: cn(className, childProps.className),
    ref,
  });
});

Slot.displayName = "Slot";

export { Slot };
