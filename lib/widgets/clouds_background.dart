import 'package:flutter/material.dart';
import 'package:jizt/widgets/platform_svg_picture.dart';

class CloudsBackground extends StatelessWidget {
  const CloudsBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: double.infinity,
        height: (screenSize.height * (2 / 5.0)),
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC3C0F1),
              Color(0xFFE5E1FC),
            ],
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              screenSize.width / 5.0,
              30.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: PlatformSvgPicture.asset(
            'assets/drawables/clouds.svg',
            width: screenSize.width / 2.0,
          ),
        ),
      ),
    ]);
  }
}
