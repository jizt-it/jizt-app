import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/home/home.dart';
import 'package:jizt/theme.dart';

class JiztApp extends StatelessWidget {
  final JiztRepository _jiztRepository;

  const JiztApp({
    Key? key,
    required JiztRepository jiztRepository,
  })  : _jiztRepository = jiztRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _jiztRepository,
      child: MaterialApp(
        home: HomePage(),
        title: 'Jizt',
        theme: lightTheme,
        // darkTheme: darkTheme, // TODO add dark theme later
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
