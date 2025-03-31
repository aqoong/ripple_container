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
  final Function()? onDragEnd;

  const RippleContainer({
    required this.child,
    this.width,
    this.height,
    this.decoration,
    this.onTap,
    this.onLongPress,
    this.onDragEnd,
    super.key,
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
          child: GestureDetector(
            onPanEnd: onDragEnd != null
                ? (details) {
                    final RenderBox box =
                        context.findRenderObject() as RenderBox;
                    final localPosition =
                        box.globalToLocal(details.globalPosition);
                    final size = box.size;

                    if (localPosition.dx >= 0 &&
                        localPosition.dx <= size.width &&
                        localPosition.dy >= 0 &&
                        localPosition.dy <= size.height) {
                      onDragEnd!();
                    }
                  }
                : null,
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
      ),
    );
  }
}
