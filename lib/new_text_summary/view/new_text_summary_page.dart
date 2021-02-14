import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/widgets/clouds_background.dart';
import 'package:jizt_repository/jizt_repository.dart';

class NewTextSummaryPage extends StatelessWidget {
  const NewTextSummaryPage._({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const NewTextSummaryPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTextSummaryCubit(
        context.read<JiztRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('New summary'),
          actions: [
            IconButton(
              tooltip: 'Settings',
              icon: Icon(Icons.settings),
              onPressed: () {
                // TODO open settings
              },
            ),
            SizedBox(width: 8)
          ],
        ),
        body: Stack(
          children: [
            CloudsBackground(),
            SafeArea(
              child: NewTextSummaryBody(),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
