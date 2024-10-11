/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/material.dart';

import 'container_decoration.dart';

class RippleContainer extends StatelessWidget {
  /// [child] is required parameter.
  ///specify the widget to be displayed within the RippleContainer.
  final Widget child;

  /// [width], [height]
  /// Sets the size of the RippleContainer.
  /// If null is entered, match the size of the child.
  final double? width;
  final double? height;

  /// [decoration] is a value used to decorate the RippleContainer Widget.
  /// If null is provided, it behaves like a Container Widget that supports onTap and onLongPress actions.
  final ContainerDecoration? decoration;

  /// The [onTap] and [onLongPress] variables are used to define the actions when this widget is selected.
  /// If both variables are null, there will be no splash effect.
  final Function()? onTap;
  final Function()? onLongPress;

  const RippleContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.decoration,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: decoration?.margin,
      decoration: BoxDecoration(
        color: decoration?.backgroundColor,
        borderRadius: decoration?.borderRadius,
        boxShadow: decoration?.boxShadow,
        backgroundBlendMode: decoration?.backgroundBlendMode,
        border: decoration?.border,
        gradient: decoration?.gradient,
      ),
      child: ClipRRect(
        borderRadius: decoration?.borderRadius ?? BorderRadius.zero,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashFactory: decoration?.splashFactory,
            splashColor: decoration?.splashColor,
            borderRadius: decoration?.borderRadius,
            onTap: onTap,
            onLongPress: onLongPress,
            child: Container(
              width: width,
              height: height,
              padding: decoration?.padding,
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}