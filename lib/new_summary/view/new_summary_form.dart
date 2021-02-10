import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_summary/new_summary.dart';
import 'package:jizt/summary/summary.dart';

class NewSummaryForm extends StatefulWidget {
  @override
  _NewSummaryFormState createState() => _NewSummaryFormState();
}

class _NewSummaryFormState extends State<NewSummaryForm> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Input:',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        TextField(
          controller: _textEditingController,
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: null,
        ),
        SizedBox(height: 64),
        ElevatedButton(
          onPressed: () {
            context.read<NewSummaryCubit>().requestNewSummary(
                  _textEditingController.text,
                );
            FocusManager.instance.primaryFocus.unfocus();
          },
          child: const Text('Summarize', style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 64),
        Text(
          'Status:',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        BlocConsumer<NewSummaryCubit, NewSummaryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == NewSummaryStatus.success) {
              onSummarySuccess(state.jobId);
            } else if (state.status == NewSummaryStatus.failure) {
              onSummaryFailure();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case NewSummaryStatus.requestingSummary:
              case NewSummaryStatus.waitingToCheckNewSummaryStatus:
              case NewSummaryStatus.checkingNewSummaryStatus:
                return Text('Processing summary...');
              case NewSummaryStatus.success:
                return Text('Done!');
              default:
                return Text('Ready to summarise!');
            }
          },
        ),
      ],
    );
  }

  void onSummarySuccess(String id) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).push<void>(
      SummaryPage.route(id),
    );
    await Future.delayed(Duration(seconds: 1));
    _textEditingController.clear();
    context.read<NewSummaryCubit>().reset();
  }

  void onSummaryFailure() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('oops try again!')),
      );
  }
}
