import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summary/bloc/summary_bloc.dart';
import 'package:jizt/summary/view/summary_form.dart';
import 'package:jizt_repository/jizt_repository.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jizt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) => SummaryBloc(
            context.read<JiztRepository>(),
          ),
          child: SummaryForm(),
        ),
      ),
    );
  }
}
