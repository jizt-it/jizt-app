import 'package:clipboard/clipboard.dart';
import 'package:domain/domain.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jizt/l10n/l10n.dart';
import 'package:jizt/summary/summary.dart';
import 'package:share_plus/share_plus.dart';

class SummaryBody extends StatelessWidget {
  SummaryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<SummaryCubit, SummaryState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SummaryLoadFailureState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l10n.allErrorUnknown)));
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
    final l10n = context.l10n;
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
                      tooltip: l10n.summaryPageBtnCopy,
                      onPressed: () => FlutterClipboard.copy(summary.output)
                          .then((_) => Fluttertoast.showToast(
                                msg: l10n.summaryPageCopied,
                              )),
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      tooltip: l10n.summaryPageBtnShare,
                      onPressed: () => Share.share(
                        l10n.summaryPageOutput(summary.output),
                      ),
                    ),
                  ],
                ),
                ExpandablePanel(
                  header: Text(
                    l10n.summaryPageOriginal,
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
                    l10n.summaryPageMoreInfo,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.summaryPageDate(DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(summary.startedAt)),
                        softWrap: true,
                      ),
                      Text(
                        l10n.summaryPageProcessingTime(summary.processingTime),
                        softWrap: true,
                      ),
                      Text(
                        l10n.summaryPageModel(summary.model.displayName),
                        softWrap: true,
                      ),
                      Text(
                        l10n.summaryRelMaxLength(
                            (summary.params.relativeMaxLength ?? 0) * 100),
                      ),
                      Text(
                        l10n.summaryRelMinLength(
                            (summary.params.relativeMinLength ?? 0) * 100),
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
