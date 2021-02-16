import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// flutter_svg library doesn't support web at the moment.
/// Web supports SVGs natively, so we can just use the Image widget.
class PlatformSvgPicture {
  static Widget asset(
    String assetPath, {
    double width,
    double height,
    BoxFit fit = BoxFit.contain,
    Color color,
    alignment = Alignment.center,
    String semanticsLabel,
  }) {
    if (kIsWeb) {
      return Image.network(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
      );
    } else {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
      );
    }
  }
}
