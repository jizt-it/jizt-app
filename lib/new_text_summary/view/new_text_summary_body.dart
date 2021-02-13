import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/summary/summary.dart';

class NewTextSummaryBody extends StatefulWidget {
  @override
  _NewTextSummaryBodyState createState() => _NewTextSummaryBodyState();
}

class _NewTextSummaryBodyState extends State<NewTextSummaryBody> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(children: [
        Expanded(
          child: NewTextSummaryInputCard(
            textEditingController: _textEditingController,
          ),
        ),
        SizedBox(height: 16),
        BlocConsumer<NewTextSummaryCubit, NewTextSummaryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == NewTextSummaryStatus.success) {
              onSummarySuccess(state.summaryId);
            } else if (state.status == NewTextSummaryStatus.failure) {
              onSummaryFailure();
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state.status != NewTextSummaryStatus.initial
                  ? () {}
                  : () {
                      context.read<NewTextSummaryCubit>().requestNewSummary(
                          source: _textEditingController.text);
                      FocusManager.instance.primaryFocus.unfocus();
                    },
              child: NewTextSummaryButtonBody(
                newTextSummaryStatus: state.status,
              ),
            );
          },
        ),
      ]),
    );
  }

  void onSummarySuccess(String id) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).push<void>(
      SummaryPage.route(id),
    );
    await Future.delayed(Duration(seconds: 1));
    _textEditingController.clear();
    context.read<NewTextSummaryCubit>().reset();
  }

  void onSummaryFailure() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('oops try again!')),
      );
  }
}

class NewTextSummaryInputCard extends StatelessWidget {
  const NewTextSummaryInputCard({
    Key key,
    @required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card',
      child: Card(
        child: TextField(
          expands: true,
          minLines: null,
          maxLines: null,
          controller: _textEditingController,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Type or paste your text...',
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            contentPadding: EdgeInsets.all(16.0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class NewTextSummaryButtonBody extends StatelessWidget {
  const NewTextSummaryButtonBody({
    Key key,
    @required NewTextSummaryStatus newTextSummaryStatus,
  })  : _newTextSummaryStatus = newTextSummaryStatus,
        super(key: key);

  final NewTextSummaryStatus _newTextSummaryStatus;

  @override
  Widget build(BuildContext context) {
    switch (_newTextSummaryStatus) {
      case NewTextSummaryStatus.requestingSummary:
      case NewTextSummaryStatus.waitingToCheckNewSummaryStatus:
      case NewTextSummaryStatus.checkingNewSummaryStatus:
        return SizedBox(
          width: 100,
          child: LinearProgressIndicator(),
        );
      case NewTextSummaryStatus.success:
        return SizedBox(
          width: 100,
          child: Icon(Icons.done),
        );
      default:
        return Text(
          'Summarize',
          style: TextStyle(fontSize: 20),
        );
    }
  }
}
