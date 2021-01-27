import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jizt/pages/home_page.dart';
import 'package:jizt/theme.dart';

class JiztApp extends StatelessWidget {
  const JiztApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Jizt',
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
