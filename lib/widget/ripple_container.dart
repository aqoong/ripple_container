/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:ripple_container/widget/container_decoration.dart';
import 'package:ripple_container/widget/ripple_callbacks.dart';

class RippleContainer extends StatefulWidget {
  /// [child] is required parameter.
  /// specify the widget to be displayed within the RippleContainer.
  final Widget child;

  /// [width], [height]
  /// Sets the size of the RippleContainer.
  /// If null is entered, match the size of the child.
  final double? width;
  final double? height;

  /// [decoration] is a value used to decorate the RippleContainer Widget.
  /// If null is provided, it behaves like a Container Widget that supports
  /// tap and long-press actions while still showing the ripple effect.
  final ContainerDecoration? decoration;

  final RippleCallbacks? rippleCallbacks;

  /// Whether the RippleContainer responds to touch.
  ///
  /// When false, no ripple is shown and every gesture callback is ignored.
  /// Defaults to true.
  final bool enabled;

  const RippleContainer({
    required this.child,
    this.width,
    this.height,
    this.decoration,
    this.rippleCallbacks,
    this.enabled = true,
    super.key,
  });

  @override
  State<RippleContainer> createState() => _RippleContainerState();
}

class _RippleContainerState extends State<RippleContainer> {
  /// Key on the interactive content so drag hit-testing uses the actual
  /// touchable box (inside the margin) rather than the outer decorated box.
  final GlobalKey _contentKey = GlobalKey();

  Offset? _dragPosition;

  /// LongPress 발생 후 같은 포인터가 올라갔을 때 Cancel을 즉시 호출하기 위한 상태
  bool _longPressFired = false;
  int? _activePointer;
  bool _didCallLongPressCancelOnPointerUp = false;

  RippleCallbacks? get _callbacks =>
      widget.enabled ? widget.rippleCallbacks : null;

  void _onPointerDown(PointerDownEvent event) {
    if (!_longPressFired) {
      _activePointer = event.pointer;
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    if (_longPressFired &&
        _activePointer == event.pointer &&
        _callbacks?.onLongPressCancel != null) {
      _callbacks!.onLongPressCancel!();
      _longPressFired = false;
      _didCallLongPressCancelOnPointerUp = true;
    }
    if (_activePointer == event.pointer) {
      _activePointer = null;
    }
  }

  /// The [RenderBox] of the interactive content, used to convert global drag
  /// positions to local coordinates and to know the touchable bounds.
  RenderBox? get _contentBox {
    final obj = _contentKey.currentContext?.findRenderObject();
    return (obj is RenderBox && obj.hasSize) ? obj : null;
  }

  @override
  Widget build(BuildContext context) {
    final decoration = widget.decoration;
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
          child: Listener(
            onPointerDown: _onPointerDown,
            onPointerUp: _onPointerUp,
            child: GestureDetector(
              onLongPress: widget.enabled
                  ? () {
                      _longPressFired = true;
                      _callbacks?.onLongPress?.call();
                    }
                  : null,
              onLongPressCancel: widget.enabled
                  ? () {
                      if (!_didCallLongPressCancelOnPointerUp &&
                          _longPressFired &&
                          _callbacks?.onLongPressCancel != null) {
                        _callbacks!.onLongPressCancel!();
                      }
                      _didCallLongPressCancelOnPointerUp = false;
                      _longPressFired = false;
                    }
                  : null,
              onLongPressDown: _callbacks?.onLongPressDown,
              onLongPressUp: _callbacks?.onLongPressUp,
              onPanStart: widget.enabled
                  ? (details) {
                      _dragPosition = null;
                      _callbacks?.onDragStart?.call(details);
                    }
                  : null,
              onPanUpdate: widget.enabled
                  ? (details) {
                      final box = _contentBox;
                      if (box != null) {
                        _dragPosition =
                            box.globalToLocal(details.globalPosition);
                      }
                      _callbacks?.onDragUpdate?.call(details);
                    }
                  : null,
              onPanEnd: _callbacks?.onDragEnd != null
                  ? (details) {
                      final box = _contentBox;
                      final pos = _dragPosition;
                      if (box != null &&
                          pos != null &&
                          pos.dx >= 0 &&
                          pos.dx <= box.size.width &&
                          pos.dy >= 0 &&
                          pos.dy <= box.size.height) {
                        _callbacks!.onDragEnd!(details);
                      }
                      _dragPosition = null;
                    }
                  : null,
              onPanCancel: _callbacks?.onDragCancel != null
                  ? () {
                      _dragPosition = null;
                      _callbacks!.onDragCancel!();
                    }
                  : null,
              child: InkWell(
                splashFactory: decoration?.splashFactory,
                splashColor: decoration?.splashColor,
                highlightColor: decoration?.highlightColor,
                hoverColor: decoration?.hoverColor,
                focusColor: decoration?.focusColor,
                mouseCursor: decoration?.mouseCursor,
                borderRadius: decoration?.borderRadius,
                onHover: _callbacks?.onHover,
                onFocusChange: _callbacks?.onFocusChange,
                // Ensure the ripple is always shown, even when no gesture
                // callbacks are supplied. An [InkWell] only paints its splash
                // while it is "enabled" (i.e. at least one tap handler is
                // non-null), so fall back to a no-op tap handler when the
                // RippleContainer itself is enabled.
                onTap: widget.enabled ? (_callbacks?.onTap ?? () {}) : null,
                onTapDown: _callbacks?.onTapDown,
                onTapUp: _callbacks?.onTapUp,
                onTapCancel: _callbacks?.onTapCancel,
                onDoubleTap: _callbacks?.onDoubleTap,
                child: Container(
                  key: _contentKey,
                  width: widget.width,
                  height: widget.height,
                  padding: decoration?.padding,
                  // Do not force an alignment when no size is given, otherwise
                  // the Container would expand to fill its parent instead of
                  // wrapping the child. When an explicit size is provided we
                  // keep the historical "center the child" default.
                  alignment: decoration?.alignment ??
                      ((widget.width != null || widget.height != null)
                          ? Alignment.center
                          : null),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
