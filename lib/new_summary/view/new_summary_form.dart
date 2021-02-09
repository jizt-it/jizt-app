import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_summary/new_summary.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Input:'),
        TextField(controller: _textEditingController),
        SizedBox(height: 64),
        ElevatedButton(
          onPressed: () {
            context.read<SummaryBloc>().add(
                  SourceSubmittedEvent(_textEditingController.text),
                );
          },
          child: const Text('Summarize', style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 64),
        Text('Summary:'),
        BlocConsumer<SummaryBloc, NewSummaryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == NewSummaryStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('oops try again!')),
                );
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case NewSummaryStatus.requestingSummary:
              case NewSummaryStatus.waitingToCheckNewSummaryStatus:
              case NewSummaryStatus.checkingNewSummaryStatus:
                return Text('Creating summary...');
              case NewSummaryStatus.success:
                return Text('${state.output}');
              default:
                return Text('Insert the text you want to summarize...');
            }
          },
        ),
      ],
    );
  }
}
