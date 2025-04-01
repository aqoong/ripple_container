/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/material.dart';

import 'package:ripple_container/widget/container_decoration.dart';

class RippleContainer extends StatefulWidget {
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
  State<RippleContainer> createState() => _RippleContainerState();
}

class _RippleContainerState extends State<RippleContainer> {
  Offset? _dragPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.decoration?.margin,
      decoration: BoxDecoration(
        color: widget.decoration?.backgroundColor,
        borderRadius: widget.decoration?.borderRadius,
        boxShadow: widget.decoration?.boxShadow,
        backgroundBlendMode: widget.decoration?.backgroundBlendMode,
        border: widget.decoration?.border,
        gradient: widget.decoration?.gradient,
      ),
      child: ClipRRect(
        borderRadius: widget.decoration?.borderRadius ?? BorderRadius.zero,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onPanUpdate: (details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              _dragPosition = box.globalToLocal(details.globalPosition);
            },
            onPanEnd: widget.onDragEnd != null
                ? (details) {
                    if (_dragPosition != null) {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final size = box.size;

                      if (_dragPosition!.dx >= 0 &&
                          _dragPosition!.dx <= size.width &&
                          _dragPosition!.dy >= 0 &&
                          _dragPosition!.dy <= size.height) {
                        widget.onDragEnd!();
                      }
                    }
                  }
                : null,
            child: InkWell(
              splashFactory: widget.decoration?.splashFactory,
              splashColor: widget.decoration?.splashColor,
              borderRadius: widget.decoration?.borderRadius,
              onTap: widget.onTap,
              onLongPress: widget.onLongPress,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding: widget.decoration?.padding,
                alignment: Alignment.center,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
