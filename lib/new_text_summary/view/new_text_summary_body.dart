import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/l10n/l10n.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt/theme.dart';

class NewTextSummaryBody extends StatefulWidget {
  @override
  _NewTextSummaryBodyState createState() => _NewTextSummaryBodyState();
}

class _NewTextSummaryBodyState extends State<NewTextSummaryBody> {
  final _textEditingController = TextEditingController();

  late final NewTextSummaryCubit _newTextSummaryCubit;
  late RangeValues _summaryLengthRange;
  FocusNode _inputNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _newTextSummaryCubit = BlocProvider.of<NewTextSummaryCubit>(context);
    final currentState = _newTextSummaryCubit.state;
    if (currentState.status == NewTextSummaryStatus.enteringText) {
      onEnteringText(currentState);
    } else {
      _showKeyboard();
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
            inputNode: _inputNode,
            textEditingController: _textEditingController,
          ),
        ),
        SizedBox(height: 16),
        SettingsCard(
          onChanged: (RangeValues range) {
            _summaryLengthRange = range;
          },
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

  void _showKeyboard() async {
    await Future.delayed(Duration(milliseconds: 500));
    FocusScope.of(context).requestFocus(_inputNode);
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
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );
  }

  void onSummarizeBtnClicked(NewTextSummaryState state) {
    FocusManager.instance.primaryFocus?.unfocus();
    _newTextSummaryCubit.requestNewSummary(
      source: _textEditingController.text,
      relativeMaxLength: _summaryLengthRange.end / 100,
      relativeMinLength: _summaryLengthRange.start / 100,
    );
  }

  void onSummarySuccess(String id) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(SummaryPage.route(id));
    await Future.delayed(Duration(seconds: 1));
    _newTextSummaryCubit.reset();
  }

  void onSummaryFailure() {
    final l10n = context.l10n;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(l10n.allErrorUnknown)),
      );
  }
}

class _NewTextSummaryInputCard extends StatelessWidget {
  const _NewTextSummaryInputCard({
    Key? key,
    required FocusNode inputNode,
    required TextEditingController textEditingController,
  })  : _inputNode = inputNode,
        _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final FocusNode _inputNode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Hero(
      tag: 'card',
      child: Card(
        child: Stack(children: [
          TextField(
            expands: true,
            minLines: null,
            maxLines: null,
            focusNode: _inputNode,
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
              hintText: l10n.newTextSummaryPageCardHint,
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
    final l10n = context.l10n;
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
              tooltip: l10n.newTextSummaryPageBtnCopy,
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

class SettingsCard extends StatefulWidget {
  final ValueChanged<RangeValues> onChanged;

  SettingsCard({required this.onChanged});

  @override
  _SettingsCardState createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  static const int MIN_RANGE = 10;
  RangeValues _summaryLengthRange = const RangeValues(10, 40);

  @override
  void initState() {
    super.initState();
    widget.onChanged(_summaryLengthRange);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          top: 16,
          right: 16,
          bottom: 8,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                l10n.newTextSummaryPageSummaryLength,
                style: TextStyle(
                  color: appPalette['primaryDarkColor'],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    l10n.newTextSummaryPageSummaryLengthPercentage(0),
                    style: TextStyle(
                      color: appPalette['secondaryTextColor'],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    l10n.newTextSummaryPageSummaryLengthPercentage(100),
                    style: TextStyle(
                      color: appPalette['secondaryTextColor'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 24,
                  ),
                  child: RangeSlider(
                    values: _summaryLengthRange,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    labels: RangeLabels(
                      l10n.newTextSummaryPageSummaryLengthPercentage(
                        _summaryLengthRange.start.round(),
                      ),
                      l10n.newTextSummaryPageSummaryLengthPercentage(
                        _summaryLengthRange.end.round(),
                      ),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _updateSlider(values);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateSlider(RangeValues range) {
    final finalRange = _getFinalRange(range);
    _summaryLengthRange = finalRange;
    widget.onChanged(finalRange);
  }

  RangeValues _getFinalRange(RangeValues range) {
    if (range.end - range.start >= MIN_RANGE) {
      return range;
    } else {
      if (_summaryLengthRange.start == range.start) {
        return RangeValues(
            _summaryLengthRange.start, _summaryLengthRange.start + MIN_RANGE);
      } else {
        return RangeValues(
            _summaryLengthRange.end - MIN_RANGE, _summaryLengthRange.end);
      }
    }
  }
}

class _NewTextSummaryButton extends StatelessWidget {
  const _NewTextSummaryButton({
    Key? key,
    required this.onPressed,
    required this.newTextSummaryStatus,
  }) : super(key: key);

  final VoidCallback onPressed;
  final NewTextSummaryStatus newTextSummaryStatus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: _getButtonBody(context),
    );
  }

  Widget _getButtonBody(BuildContext context) {
    final l10n = context.l10n;
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
          l10n.newTextSummaryPageBtnSummarize,
          style: TextStyle(fontSize: 20),
        );
    }
  }
}
