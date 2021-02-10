import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt_repository/jizt_repository.dart';

class SummariesPage extends StatelessWidget {
  const SummariesPage._({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => SummariesCubit(
          context.read<JiztRepository>(),
        )..loadSummaries(),
        child: const SummariesPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summaries'),
      ),
      body: SummariesList(),
    );
  }
}
