/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */
library ripple_container;

import 'package:flutter/material.dart';

import 'container_decoration.dart';

class RippleContainer extends ContainerDecoration {
  /// [child] is required parameter.
  ///specify the widget to be displayed within the RippleContainer.
  final Widget child;

  /// The [onTap] and [onLongPress] variables are used to define the actions when this widget is selected.
  /// If both variables are null, there will be no splash effect.
  final Function()? onTap;
  final Function()? onLongPress;

  const RippleContainer({
    super.key,
    required this.child,
    super.width,
    super.height,
    super.backgroundColor,
    super.borderRadius = BorderRadius.zero,
    super.padding = EdgeInsets.zero,
    super.margin = EdgeInsets.zero,
    super.backgroundBlendMode,
    super.boxShadow,
    super.border,
    super.gradient,
    super.splashFactory,
    super.splashColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        backgroundBlendMode: backgroundBlendMode,
        border: border,
        gradient: gradient,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashFactory: splashFactory,
            splashColor: splashColor,
            borderRadius: borderRadius,
            onTap: onTap,
            onLongPress: onLongPress,
            child: Container(
              width: width,
              height: height,
              padding: padding,
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
