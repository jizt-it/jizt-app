import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jizt/home/home.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/widgets/clouds_background.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform =
      const MethodChannel('it.jizt.app.channel.shared.text');

  @override
  void initState() {
    super.initState();
    _getSharedText();
  }

  /// Gets the text shared with Jizt by the user using the native share dialog
  /// Android only for now
  _getSharedText() async {
    if (!Platform.isAndroid) return;
    final sharedData = await platform.invokeMethod("getSharedText");
    _onSharedTextReceived(sharedData);
  }

  void _onSharedTextReceived(String text) {
    if (text != null) {
      Navigator.of(context).push<void>(
        NewTextSummaryPage.route(initialText: text),
      );
    }
  }

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
