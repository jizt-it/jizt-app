part of 'new_summary_bloc.dart';

enum NewSummaryStatus {
  initial,
  requestingSummary,
  waitingToCheckNewSummaryStatus,
  checkingNewSummaryStatus,
  success,
  failure
}

class NewSummaryState extends Equatable {
  final NewSummaryStatus status;
  final String source;
  final String summaryId;

  const NewSummaryState._({
    this.status = NewSummaryStatus.initial,
    this.source = "",
    this.summaryId = "",
  });

  const NewSummaryState.initial() : this._();

  const NewSummaryState.requestingSummary(String source)
      : this._(
          status: NewSummaryStatus.requestingSummary,
          source: source,
        );

  const NewSummaryState.waitingToCheckNewSummaryStatus(
      String source, String summaryId)
      : this._(
          status: NewSummaryStatus.waitingToCheckNewSummaryStatus,
          source: source,
          summaryId: summaryId,
        );

  const NewSummaryState.checkingNewSummaryStatus(
      String source, String summaryId)
      : this._(
          status: NewSummaryStatus.checkingNewSummaryStatus,
          source: source,
          summaryId: summaryId,
        );

  const NewSummaryState.success(String source, String summaryId)
      : this._(
          status: NewSummaryStatus.success,
          source: source,
          summaryId: summaryId,
        );

  const NewSummaryState.failure() : this._(status: NewSummaryStatus.failure);

  @override
  List<Object> get props => [status, source, summaryId];
}
