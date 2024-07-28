/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */
library ripple_container;

import 'package:flutter/material.dart';

import 'container_actions.dart';
import 'effect_options.dart';

class RippleContainer extends StatelessWidget {
  /// [child] is required parameter.
  ///specify the widget to be displayed within the RippleContainer.
  final Widget child;

  /// [width], [height]
  /// Sets the size of the RippleContainer.
  /// If null is entered, match the size of the child.
  final double? width;
  final double? height;

  /// [backgroundColor]
  /// Sets the background color of the RippleContainer.
  /// If null is entered, transparent color is the default.
  final Color backgroundColor;

  /// [decoration] is RippleContainer's decoration
  final Decoration? decoration;

  final EffectOptions? effectOptions;

  final ContainerActions? containerActions;


  const RippleContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.decoration,
    this.effectOptions,
    this.containerActions,
  });

  @override
  Widget build(BuildContext context) {
    /// Method for preventing overlapping use conflict between color and backgroundColor in BoxDecoration.
    final reinterpretationDeco = reinterpretationDecoration(decoration, backgroundColor);

    return Container(
      width: width,
      height: height,
      decoration: reinterpretationDeco,
      color: (reinterpretationDeco is BoxDecoration) ? null : backgroundColor,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          ///Actions
          onTap: containerActions?.onTap ?? () {},
          onTapCancel: containerActions?.onTapCancel,
          onTapDown: containerActions?.onTapDown,
          onTapUp: containerActions?.onTapUp,
          onSecondaryTap: containerActions?.onSecondaryTap,
          onSecondaryTapCancel: containerActions?.onSecondaryTapCancel,
          onSecondaryTapDown: containerActions?.onSecondaryTapDown,
          onSecondaryTapUp: containerActions?.onSecondaryTapUp,
          onDoubleTap: containerActions?.onDoubleTap,
          onLongPress: containerActions?.onLongPress,
          mouseCursor: containerActions?.mouseCursor,
          onHighlightChanged: containerActions?.onHighlightChanged,
          onHover: containerActions?.onHover,
          ///InkGraphic Options
          borderRadius: effectOptions?.borderRadius,
          autofocus: effectOptions?.autofocus ?? false,
          canRequestFocus: effectOptions?.canRequestFocus ?? true,
          customBorder: effectOptions?.customBorder,
          enableFeedback: effectOptions?.enableFeedback,
          excludeFromSemantics: effectOptions?.excludeFromSemantics ?? false,
          focusColor: effectOptions?.focusColor,
          focusNode: effectOptions?.focusNode,
          highlightColor: effectOptions?.highlightColor,
          hoverColor: effectOptions?.hoverColor,
          hoverDuration: effectOptions?.hoverDuration,
          onFocusChange: effectOptions?.onFocusChange,
          overlayColor: effectOptions?.overlayColor,
          radius: effectOptions?.radius,
          splashColor: effectOptions?.splashColor,
          splashFactory: effectOptions?.splashFactory,
          statesController: effectOptions?.statesController,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }

  // Method for preventing overlapping use conflict between color and backgroundColor in BoxDecoration.
  Decoration? reinterpretationDecoration(Decoration? decoration, Color backgroundColor) {
    Decoration? resultDecoration = decoration;
    if (decoration is BoxDecoration) {
      final BoxDecoration boxDecoration = decoration;
      resultDecoration = boxDecoration.copyWith(color: backgroundColor);
    }
    return resultDecoration;
  }
}
