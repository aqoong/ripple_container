## 0.0.1

* Test Version

## 0.1.0

* overridden the interface.
```
const RippleContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.backgroundBlendMode,
    this.boxShadow,
    this.border,
    this.gradient,
    this.splashFactory,
    this.splashColor,
    this.onTap,
    this.onLongPress,
  });
```

## 0.1.2
* Expand supported SDK versions
* Fix the problem that the color does not apply if the "BackgroundColor" value is not set and "Gradient" is set

## 1.0.0
* Created a ContainerDecoration class to separate the decoration functionality. This is to allow for the extended use of the RippleContainer widget.

## 1.0.1
* The ContainerDecoration has been completely separated as nullable data. If it’s null, it behaves like a Container that supports tap actions.

## 1.1.0
* RippleContainer now supports onTap, onLongPress, and onDragEnd.
* Added onDragEnd callback to handle drag gestures ending within the widget's boundaries.

## 1.2.0
- Introduced `RippleCallbacks` class to encapsulate gesture callbacks for `RippleContainer`.
- Enhanced `RippleContainer` to support comprehensive gesture interactions via `RippleCallbacks`.

## 1.2.1
- Fix the problem that the cancellation event did not occur if the cancellation occurred after the LongPress event occurred
- Update how to use README.md

## 1.3.0
- Fix: the ripple effect is now shown even when no `rippleCallbacks` are provided (the internal `InkWell` was previously disabled with no callbacks, so no ripple was painted).
- Fix: `RippleContainer` no longer expands to fill its parent when `width`/`height` are omitted. It now sizes itself to the child as documented.
- Fix: `onDragEnd` boundary detection now uses the actual touchable content box instead of the outer (margin-inclusive) box, and the tracked drag position is reset on drag start/end/cancel to avoid stale results.
- Add: `RippleContainer.enabled` flag to disable the ripple and all gesture callbacks.
- Add: `ContainerDecoration.alignment` to control the child's placement. When a `width`/`height` is set and `alignment` is left null, the child is centered (previous default). When no size is set, the container hugs the child.
- Add: `ContainerDecoration.highlightColor`, `hoverColor`, `focusColor`, and `mouseCursor` for better web / desktop interaction.
- Add: `RippleCallbacks.onHover` and `onFocusChange`.
- Add: initial widget test suite covering sizing, ripple visibility, tap callbacks, drag boundaries, the enabled flag, and long-press cancel.

## 1.3.1
- Perf: the ripple now appears immediately on tap. Previously a pan (and long-press) gesture recognizer was always attached, competing with the tap recognizer in the gesture arena and delaying the splash. These recognizers are now attached only when the corresponding drag/long-press callbacks are provided.
- Add: tests asserting the pan/long-press recognizers are attached only when the matching callbacks are provided.