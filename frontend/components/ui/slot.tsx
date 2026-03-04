import * as React from "react";
import { cn } from "@/lib/utils";

type SlotProps = React.HTMLAttributes<HTMLElement> & {
  children: React.ReactElement;
};

const Slot = React.forwardRef<HTMLElement, SlotProps>(({ children, className, ...props }, ref) => {
  if (!React.isValidElement(children)) {
    return null;
  }

  return React.cloneElement(children, {
    ...props,
    ...children.props,
    className: cn(className, children.props.className),
    ref,
  });
});

Slot.displayName = "Slot";

export { Slot };
