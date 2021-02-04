import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/summary/bloc/summary_bloc.dart';

class SummaryForm extends StatefulWidget {
  @override
  _SummaryFormState createState() => _SummaryFormState();
}

class _SummaryFormState extends State<SummaryForm> {
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
        BlocConsumer<SummaryBloc, SummaryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == SummaryStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('oops try again!')),
                );
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case SummaryStatus.requestingSummary:
              case SummaryStatus.waitingToCheckSummaryStatus:
              case SummaryStatus.checkingSummaryStatus:
                return Text('Creating summary...');
              case SummaryStatus.success:
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
