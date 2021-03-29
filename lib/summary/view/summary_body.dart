import 'package:clipboard/clipboard.dart';
import 'package:domain/domain.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jizt/summary/summary.dart';
import 'package:share/share.dart';

class SummaryBody extends StatelessWidget {
  SummaryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummaryCubit, SummaryState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SummaryLoadFailureState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                  content: Text('Something went wrong. '
                      'Please try again.')),
            );
        }
      },
      builder: (context, state) {
        if (state is SummaryLoadSuccessState) {
          return SummaryBodyCard(summary: state.summary);
        } else {
          return Container();
        }
      },
    );
  }
}

class SummaryBodyCard extends StatelessWidget {
  const SummaryBodyCard({
    Key? key,
    required this.summary,
  }) : super(key: key);

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  summary.output,
                  softWrap: true,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.copy),
                      tooltip: 'Copy',
                      onPressed: () => FlutterClipboard.copy(summary.output)
                          .then((_) => Fluttertoast.showToast(msg: "Copied!")),
                    ),
                    Visibility(
                      child: IconButton(
                        icon: Icon(Icons.share),
                        tooltip: 'Share',
                        onPressed: () => Share.share(
                            '${summary.output}\n\nSummary generated '
                            'using www.jizt.it'),
                      ),
                      visible: !kIsWeb, // disable in web version
                    ),
                  ],
                ),
                ExpandablePanel(
                  header: Text(
                    'Original',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  collapsed: Container(),
                  expanded: Text(
                    summary.source,
                    softWrap: true,
                  ),
                  theme: ExpandableThemeData(
                      tapHeaderToExpand: true,
                      hasIcon: true,
                      headerAlignment: ExpandablePanelHeaderAlignment.center),
                ),
                ExpandablePanel(
                  header: Text(
                    'More info',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(summary.startedAt)}',
                        softWrap: true,
                      ),
                      Text(
                        'Processing time: ${summary.processingTime}s',
                        softWrap: true,
                      ),
                      Text(
                        'Model: ${summary.model.displayName}',
                        softWrap: true,
                      ),
                      Text(
                        'Relative max length: ${(summary.params.relativeMaxLength ?? 0) * 100}%',
                      ),
                      Text(
                        'Relative min length: ${(summary.params.relativeMinLength ?? 0) * 100}%',
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                      tapHeaderToExpand: true,
                      hasIcon: true,
                      headerAlignment: ExpandablePanelHeaderAlignment.center),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
