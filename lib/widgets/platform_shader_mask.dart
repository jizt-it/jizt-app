import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ShaderMask is currently not supported for web.
/// To workaround it we replace it with a simple container.
/// https://github.com/flutter/flutter/issues/44152
class PlatformShaderMask extends StatelessWidget {
  const PlatformShaderMask({
    Key? key,
    required this.shaderCallback,
    required this.blendMode,
    this.child,
  }) : super(key: key);

  final ShaderCallback shaderCallback;
  final BlendMode blendMode;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container(child: child);
    } else {
      return ShaderMask(
        shaderCallback: shaderCallback,
        blendMode: blendMode,
        child: child,
      );
    }
  }
}
