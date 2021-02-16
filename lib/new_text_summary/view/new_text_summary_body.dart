import 'package:clipboard/clipboard.dart';
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

  NewTextSummaryCubit _newTextSummaryCubit;

  @override
  void initState() {
    super.initState();
    _newTextSummaryCubit = BlocProvider.of<NewTextSummaryCubit>(context);
    final currentState = _newTextSummaryCubit.state;
    if (currentState.status == NewTextSummaryStatus.enteringText) {
      onEnteringText(currentState);
    }
  }

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
          child: _NewTextSummaryInputCard(
            textEditingController: _textEditingController,
          ),
        ),
        SizedBox(height: 16),
        BlocConsumer<NewTextSummaryCubit, NewTextSummaryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (_, state) => onStateChanged(state),
          builder: (context, state) {
            return _NewTextSummaryButton(
              onPressed: () => onSummarizeBtnClicked(state),
              newTextSummaryStatus: state.status,
            );
          },
        ),
      ]),
    );
  }

  void onStateChanged(NewTextSummaryState state) {
    if (state.status == NewTextSummaryStatus.enteringText) {
      onEnteringText(state);
    } else if (state.status == NewTextSummaryStatus.success) {
      onSummarySuccess(state.summaryId);
    } else if (state.status == NewTextSummaryStatus.failure) {
      onSummaryFailure();
    }
  }

  void onEnteringText(NewTextSummaryState state) {
    _textEditingController.text = state.source;
  }

  void onSummarizeBtnClicked(NewTextSummaryState state) {
    FocusManager.instance.primaryFocus.unfocus();
    _newTextSummaryCubit.requestNewSummary(source: _textEditingController.text);
  }

  void onSummarySuccess(String id) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(SummaryPage.route(id));
    await Future.delayed(Duration(seconds: 1));
    _newTextSummaryCubit.reset();
  }

  void onSummaryFailure() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('oops try again!')),
      );
  }
}

class _NewTextSummaryInputCard extends StatelessWidget {
  const _NewTextSummaryInputCard({
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
        child: Stack(children: [
          TextField(
            expands: true,
            minLines: null,
            maxLines: null,
            controller: _textEditingController,
            onChanged: (text) {
              final cubit = BlocProvider.of<NewTextSummaryCubit>(context);
              if (text.isEmpty)
                cubit.reset();
              else
                cubit.enteringText();
            },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Type or paste your text...',
              hintStyle: TextStyle(fontSize: 15),
              contentPadding: EdgeInsets.all(16.0),
              border: InputBorder.none,
            ),
          ),
          BlocProvider.value(
            value: BlocProvider.of<NewTextSummaryCubit>(context),
            child: _PasteButton(),
          ),
        ]),
      ),
    );
  }
}

class _PasteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTextSummaryCubit, NewTextSummaryState>(
      buildWhen: (previous, current) =>
          previous.status == NewTextSummaryStatus.initial ||
          current.status == NewTextSummaryStatus.initial,
      builder: (context, state) {
        return Align(
          alignment: Alignment.topRight,
          child: Visibility(
            visible: state.status == NewTextSummaryStatus.initial,
            child: IconButton(
              icon: Icon(Icons.paste),
              iconSize: 16,
              tooltip: 'Copy',
              onPressed: () => FlutterClipboard.paste().then((value) => context
                  .read<NewTextSummaryCubit>()
                  .enteringText(initialText: value)),
            ),
          ),
        );
      },
    );
  }
}

class _NewTextSummaryButton extends StatelessWidget {
  const _NewTextSummaryButton({
    Key key,
    @required this.onPressed,
    @required this.newTextSummaryStatus,
  }) : super(key: key);

  final VoidCallback onPressed;
  final NewTextSummaryStatus newTextSummaryStatus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: _getButtonBody(),
    );
  }

  Widget _getButtonBody() {
    switch (newTextSummaryStatus) {
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
