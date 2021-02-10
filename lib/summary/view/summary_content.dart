import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summary/summary.dart';

class SummaryContent extends StatelessWidget {
  SummaryContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummaryCubit, SummaryState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SummaryLoadFailureState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('oops try again!')),
            );
        }
      },
      builder: (context, state) {
        if (state is SummaryLoadSuccessState) {
          final summary = state.summary;
          return ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Text(
                'Summary:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text('${summary.output}'),
              SizedBox(height: 16),
              Text(
                'Created:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text('${summary.startedAt}'),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
