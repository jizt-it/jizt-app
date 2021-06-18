import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/l10n/l10n.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt/widgets/clouds_background.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage._({Key? key}) : super(key: key);

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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.summaryPageTitle),
        actions: [
          IconButton(
            tooltip: l10n.summaryPageBtnDelete,
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
