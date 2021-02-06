part of 'summary_bloc.dart';

enum SummaryStatus {
  initial,
  requestingSummary,
  waitingToCheckSummaryStatus,
  checkingSummaryStatus,
  success,
  failure
}

class SummaryState {
  final SummaryStatus status;
  final String source;
  final String jobId;
  final String output;

  const SummaryState._({
    this.status = SummaryStatus.initial,
    this.source = "",
    this.jobId = "",
    this.output = "",
  });

  const SummaryState.initial() : this._();

  const SummaryState.requestingSummary(String source)
      : this._(
          status: SummaryStatus.requestingSummary,
          source: source,
        );

  const SummaryState.waitingToCheckSummaryStatus(String jobId)
      : this._(
          status: SummaryStatus.waitingToCheckSummaryStatus,
          jobId: jobId,
        );

  const SummaryState.checkingSummaryStatus(String jobId)
      : this._(
          status: SummaryStatus.checkingSummaryStatus,
          jobId: jobId,
        );

  const SummaryState.success(String output)
      : this._(status: SummaryStatus.success, output: output);

  const SummaryState.failure() : this._(status: SummaryStatus.failure);

  @override
  String toString() => 'SummaryState {status=$status,output=$output}';
}
