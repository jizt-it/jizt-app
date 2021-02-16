import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt/widgets/clouds_background.dart';

class SummariesPage extends StatelessWidget {
  const SummariesPage._({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const SummariesPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummariesCubit(
        context.read<JiztRepository>(),
      )..loadSummaries(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Summaries'),
        ),
        body: Stack(
          children: [
            CloudsBackground(),
            SafeArea(
              child: SummariesList(),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
