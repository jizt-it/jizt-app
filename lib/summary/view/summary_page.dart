import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt/widgets/clouds_background.dart';
import 'package:jizt_repository/jizt_repository.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage._({Key key}) : super(key: key);

  static Route route(String id) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => SummaryCubit(
          context.read<JiztRepository>(),
        )..loadSummary(id),
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
              context.read<SummaryCubit>()..deleteSummary();
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 8)
        ],
      ),
      body: Stack(
        children: [
          CloudsBackground(),
          SafeArea(
            child: SummaryBody(),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
