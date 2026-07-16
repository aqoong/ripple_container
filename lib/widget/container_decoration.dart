/*
 * Copyright (c) 2024. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/material.dart';

class ContainerDecoration {
  /// [backgroundColor]
  /// Sets the background color of the RippleContainer.
  final Color? backgroundColor;
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

  /// [alignment] positions the [child] within the RippleContainer.
  ///
  /// When null, the RippleContainer sizes itself to the child (like a plain
  /// [Container]). If a [width] or [height] is provided on the RippleContainer
  /// and [alignment] is left null, the child is centered by default.
  ///
  /// Set this explicitly (e.g. [Alignment.centerLeft]) to control child
  /// placement, or set it to null together with an explicit size to keep the
  /// child top-left aligned.
  final Alignment? alignment;

  /// The [boxShadow] variable is used to apply a shadow outside the Container.
  final List<BoxShadow>? boxShadow;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory:
  /// [ThemeData.splashFactory].
  ///
  /// See also:
  ///
  ///  * [borderRadius], the (maximum) size of the ink splash.
  ///  * [splashColor], the color of the splash.
  ///  * [splashColor], the color of the highlight.
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
  ///  * [borderRadius], the (maximum) size of the ink splash.
  ///  * [splashColor], the color of the highlight.
  final Color? splashColor;

  /// The highlight color shown while the container is pressed.
  ///
  /// If null, the theme's [ThemeData.highlightColor] is used.
  final Color? highlightColor;

  /// The color shown while a pointer is hovering over the container
  /// (web / desktop). If null, the theme's hover color is used.
  final Color? hoverColor;

  /// The color shown while the container has input focus.
  /// If null, the theme's focus color is used.
  final Color? focusColor;

  /// The cursor shown when a pointer hovers over the container
  /// (web / desktop). If null, [SystemMouseCursors.click] is used while the
  /// container is enabled.
  final MouseCursor? mouseCursor;

  const ContainerDecoration({
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.alignment,
    this.backgroundBlendMode,
    this.boxShadow,
    this.border,
    this.gradient,
    this.splashFactory,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.focusColor,
    this.mouseCursor,
  });
}
