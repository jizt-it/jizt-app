import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt/summary/summary.dart';

class SummariesList extends StatelessWidget {
  SummariesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummariesBloc, SummariesState>(
      listenWhen: (previous, current) => previous != current,
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
          final summariesIds = state.summaries.keys.toList(growable: false);
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: summariesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${summariesIds[index]}'),
                onTap: () => Navigator.of(context).push<void>(
                  SummaryPage.route(summariesIds[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
