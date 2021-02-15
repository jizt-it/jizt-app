import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/widgets/clouds_background.dart';
import 'package:jizt_repository/jizt_repository.dart';

class NewTextSummaryPage extends StatelessWidget {
  const NewTextSummaryPage._({Key key, this.initialText}) : super(key: key);

  final String initialText;

  static Route route({String initialText}) {
    return MaterialPageRoute<void>(
      builder: (context) => NewTextSummaryPage._(initialText: initialText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = NewTextSummaryCubit(
          context.read<JiztRepository>(),
        );
        if (initialText != null) {
          cubit.enteringText(initialText: initialText);
        }
        return cubit;
      },
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
