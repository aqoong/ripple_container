/*
 * Copyright (c) 2025. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/gestures.dart';

/// A container for gesture callbacks used by [RippleContainer].
///
/// This class encapsulates various gesture callbacks such as tap, long press,
/// drag, and double tap. Assigning these callbacks allows [RippleContainer]
/// to respond to user interactions accordingly.
class RippleCallbacks {
  /// Called when a tap gesture is recognized.
  final GestureTapCallback? onTap;
  /// Called when a tap gesture has been detected.
  final GestureTapDownCallback? onTapDown;
  /// Called when a tap gesture is completed.
  final GestureTapUpCallback? onTapUp;
  /// Called when a tap gesture is canceled.
  final GestureTapCancelCallback? onTapCancel;

  /// Called when a long press gesture is recognized.
  final GestureLongPressCallback? onLongPress;
  /// Called when a long press gesture has been detected.
  final GestureLongPressDownCallback? onLongPressDown;
  /// Called when a long press gesture is completed.
  final GestureLongPressUpCallback? onLongPressUp;
  /// Called when a long press gesture is canceled.
  final GestureLongPressCancelCallback? onLongPressCancel;

  /// Called when a drag gesture starts.
  final GestureDragStartCallback? onDragStart;
  /// Called when a drag gesture is updated.
  final GestureDragUpdateCallback? onDragUpdate;
  /// Called when a drag gesture ends.
  final GestureDragEndCallback? onDragEnd;
  /// Called when a drag gesture is canceled.
  final GestureDragCancelCallback? onDragCancel;

  /// Called when a double tap gesture is recognized.
  final GestureDoubleTapCallback? onDoubleTap;

  const RippleCallbacks({
    this.onTapDown,
    this.onTap,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressDown,
    this.onLongPress,
    this.onLongPressUp,
    this.onLongPressCancel,
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
    this.onDragCancel,
    this.onDoubleTap,
  });
}
