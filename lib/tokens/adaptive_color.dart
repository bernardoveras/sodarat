// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'colors/colors.dart';

class $adaptive_color {
  const $adaptive_color._();

  // Check if it's dark mode
  static bool _isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Brand colors
  static Color primary({bool hover = false}) => hover == false ? $primary_color : $primary_color_hover;
  static Color on_primary() => $on_primary_color;

  // Semantic colors
  static Color positive() => $positive_color;
  static Color positive_container() => $positive_container_color;
  static Color on_positive_container() => $on_positive_container_color;

  static Color negative() => $negative_color;
  static Color negative_container() => $negative_container_color;
  static Color on_negative_container() => $on_negative_container_color;

  // Surface colors
  static Color surface_primary(BuildContext context) {
    if (_isDarkMode(context)) {
      return $dark_surface_primary;
    } else {
      return $light_surface_primary;
    }
  }

  static Color surface_secondary(BuildContext context, {bool hover = false}) {
    if (_isDarkMode(context)) {
      return hover ? $dark_surface_secondary_hover : $dark_surface_secondary;
    } else {
      return hover ? $light_surface_secondary_hover : $light_surface_secondary;
    }
  }

  // Text colors
  static Color text_primary(BuildContext context) => _isDarkMode(context) ? $dark_text_primary : $light_text_primary;
  static Color text_secondary(BuildContext context) => _isDarkMode(context) ? $dark_text_primary : $light_text_primary;
  static Color text_on_tooltip(BuildContext context) => _isDarkMode(context) ? $dark_text_on_tooltip : $light_text_on_tooltip;

  //Others
  static Color background(BuildContext context) => _isDarkMode(context) ? $dark_background : $light_background;
  static Color on_background_color(BuildContext context) => _isDarkMode(context) ? const Color(0xFFFFFFFF) : const Color(0xff27272a);
  static Color tooltip(BuildContext context) => _isDarkMode(context) ? $dark_tooltip : $light_tooltip;
  static Color stroke(BuildContext context) => _isDarkMode(context) ? $dark_stroke : $light_stroke;
}
