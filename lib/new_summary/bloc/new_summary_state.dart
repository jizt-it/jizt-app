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
  final String jobId;

  const NewSummaryState._({
    this.status = NewSummaryStatus.initial,
    this.source = "",
    this.jobId = "",
  });

  const NewSummaryState.initial() : this._();

  const NewSummaryState.requestingSummary(String source)
      : this._(
          status: NewSummaryStatus.requestingSummary,
          source: source,
        );

  const NewSummaryState.waitingToCheckNewSummaryStatus(
      String source, String jobId)
      : this._(
          status: NewSummaryStatus.waitingToCheckNewSummaryStatus,
          source: source,
          jobId: jobId,
        );

  const NewSummaryState.checkingNewSummaryStatus(String source, String jobId)
      : this._(
          status: NewSummaryStatus.checkingNewSummaryStatus,
          source: source,
          jobId: jobId,
        );

  const NewSummaryState.success(String source, String jobId)
      : this._(
          status: NewSummaryStatus.success,
          source: source,
          jobId: jobId,
        );

  const NewSummaryState.failure() : this._(status: NewSummaryStatus.failure);

  @override
  List<Object> get props => [status, source, jobId];
}
