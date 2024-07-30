/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */
library ripple_container;

import 'package:flutter/material.dart';

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
  final BlendMode? backgroundBlendMode;

  final Gradient? gradient;

  /// The [borderRadius] determines the border radius of the Container,
  /// and the child is clipped to fit the Container.
  /// default value is [BorderRadius.zero]
  final BorderRadius borderRadius;
  final BoxBorder? border;

  /// [padding] is applied inside the Container,
  /// while [margin] is the value used to create space outside the Container.
  /// default value is [EdgeInsets.zero].
  final EdgeInsets padding;
  final EdgeInsets margin;

  /// The [boxShadow] variable is used to apply a shadow outside the Container.
  final List<BoxShadow>? boxShadow;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  ///
  /// See also:
  ///
  ///  * [radius], the (maximum) size of the ink splash.
  ///  * [splashColor], the color of the splash.
  ///  * [highlightColor], the color of the highlight.
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The splash color of the ink response. If this property is null then the
  /// splash color of the theme, [ThemeData.splashColor], will be used.
  ///
  /// See also:
  ///
  ///  * [splashFactory], which defines the appearance of the splash.
  ///  * [radius], the (maximum) size of the ink splash.
  ///  * [highlightColor], the color of the highlight.
  final Color? splashColor;


  /// The [onTap] and [onLongPress] variables are used to define the actions when this widget is selected.
  /// If both variables are null, there will be no splash effect.
  final Function()? onTap;
  final Function()? onLongPress;

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
