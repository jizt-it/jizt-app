part of 'new_text_summary_cubit.dart';

enum NewTextSummaryStatus {
  initial,
  enteringText,
  requestingSummary,
  waitingToCheckNewSummaryStatus,
  checkingNewSummaryStatus,
  success,
  failure
}

class NewTextSummaryState extends Equatable {
  final NewTextSummaryStatus status;
  final String source;
  final String summaryId;

  const NewTextSummaryState._({
    this.status = NewTextSummaryStatus.initial,
    this.source = "",
    this.summaryId = "",
  });

  const NewTextSummaryState.initial()
      : this._(status: NewTextSummaryStatus.initial);

  const NewTextSummaryState.enteringText({String? source})
      : this._(status: NewTextSummaryStatus.enteringText, source: source ?? "");

  const NewTextSummaryState.requestingSummary(String source)
      : this._(
          status: NewTextSummaryStatus.requestingSummary,
          source: source,
        );

  const NewTextSummaryState.waitingToCheckNewSummaryStatus(
      String source, String summaryId)
      : this._(
          status: NewTextSummaryStatus.waitingToCheckNewSummaryStatus,
          source: source,
          summaryId: summaryId,
        );

  const NewTextSummaryState.checkingNewSummaryStatus(
      String source, String summaryId)
      : this._(
          status: NewTextSummaryStatus.checkingNewSummaryStatus,
          source: source,
          summaryId: summaryId,
        );

  const NewTextSummaryState.success(String source, String summaryId)
      : this._(
          status: NewTextSummaryStatus.success,
          source: source,
          summaryId: summaryId,
        );

  const NewTextSummaryState.failure()
      : this._(status: NewTextSummaryStatus.failure);

  @override
  List<Object> get props => [status, source, summaryId];
}
