import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_summary/new_summary.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt_repository/jizt_repository.dart';

class NewSummaryPage extends StatelessWidget {
  NewSummaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jizt'),
        actions: [
          IconButton(
            tooltip: 'Summaries',
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).push<void>(
                SummariesPage.route(),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) => NewSummaryCubit(
            context.read<JiztRepository>(),
          ),
          child: NewSummaryForm(),
        ),
      ),
    );
  }
}
