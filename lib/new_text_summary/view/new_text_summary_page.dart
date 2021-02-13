import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/utils/fade_page_route.dart';
import 'package:jizt/widgets/clouds_background.dart';
import 'package:jizt_repository/jizt_repository.dart';

class NewTextSummaryPage extends StatelessWidget {
  const NewTextSummaryPage._({Key key}) : super(key: key);

  static Route route() {
    return FadePageRoute(page: const NewTextSummaryPage._());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New summary'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO open settings
            },
          )
        ],
      ),
      body: Stack(
        children: [
          CloudsBackground(),
          SafeArea(
            child: BlocProvider(
              create: (context) => NewTextSummaryCubit(
                context.read<JiztRepository>(),
              ),
              child: NewTextSummaryBody(),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
