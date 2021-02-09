import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt_repository/jizt_repository.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage._({Key key}) : super(key: key);

  static Route route(String id) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => SummaryBloc(
          context.read<JiztRepository>(),
        )..add(LoadSummaryEvent(id)),
        child: const SummaryPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        actions: [
          IconButton(
            tooltip: 'Delete summary',
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<SummaryBloc>().add(DeleteSummaryEvent());
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SummaryContent(),
      ),
    );
  }
}
