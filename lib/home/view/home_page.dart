import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jizt/home/home.dart';
import 'package:jizt/widgets/clouds_background.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'More',
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              // TODO Open menu
            },
          ),
          SizedBox(width: 8)
        ],
      ),
      body: Stack(
        children: [
          CloudsBackground(),
          SafeArea(
            child: HomeBody(),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
