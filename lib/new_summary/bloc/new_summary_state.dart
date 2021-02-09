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
  final String output;

  const NewSummaryState._({
    this.status = NewSummaryStatus.initial,
    this.source = "",
    this.jobId = "",
    this.output = "",
  });

  const NewSummaryState.initial() : this._();

  const NewSummaryState.requestingSummary(String source)
      : this._(
          status: NewSummaryStatus.requestingSummary,
          source: source,
        );

  const NewSummaryState.waitingToCheckNewSummaryStatus(String jobId)
      : this._(
          status: NewSummaryStatus.waitingToCheckNewSummaryStatus,
          jobId: jobId,
        );

  const NewSummaryState.checkingNewSummaryStatus(String jobId)
      : this._(
          status: NewSummaryStatus.checkingNewSummaryStatus,
          jobId: jobId,
        );

  const NewSummaryState.success(String output)
      : this._(status: NewSummaryStatus.success, output: output);

  const NewSummaryState.failure() : this._(status: NewSummaryStatus.failure);

  @override
  List<Object> get props => [status, source, jobId, output];
}
