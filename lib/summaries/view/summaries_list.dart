import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt/theme.dart';
import 'package:jizt/widgets/date_label.dart';

class SummariesList extends StatelessWidget {
  SummariesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummariesCubit, SummariesState>(
      listener: (context, state) {
        if (state is SummariesLoadFailureState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('oops try again!')),
            );
        }
      },
      builder: (context, state) {
        if (state is SummariesLoadSuccessState) {
          return ListView.builder(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            physics: BouncingScrollPhysics(),
            itemCount: state.summaries.length,
            itemBuilder: (BuildContext context, int index) {
              final summary = state.summaries[index];
              return _SummariesListItem(summary: summary);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _SummariesListItem extends StatelessWidget {
  const _SummariesListItem({
    Key key,
    @required this.summary,
  }) : super(key: key);

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push<void>(
        SummaryPage.route(summary.id),
      ),
      child: Card(
        color: appPalette['primaryColor'],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: DateLabel(date: summary.startedAt),
              ),
              SizedBox(height: 8),
              Text(
                '${summary.output}',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
