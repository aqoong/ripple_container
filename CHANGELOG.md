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