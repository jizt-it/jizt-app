import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final JiztRepository _jiztRepository;
  final PollingDispatcher _pollingDispatcher = PollingDispatcher();

  SummaryBloc(this._jiztRepository) : super(const SummaryState.initial());

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is SourceSubmittedEvent) {
      yield* _mapSourceSubmittedEventToState(event, state);
    } else if (event is CheckSummaryStatusEvent) {
      yield* _mapCheckSummaryStatusEventToState(state);
    }
  }

  Stream<SummaryState> _mapSourceSubmittedEventToState(
    SourceSubmittedEvent event,
    SummaryState state,
  ) async* {
    if (state.status != SummaryStatus.initial || event.source.isEmpty) {
      yield const SummaryState.initial();
      return;
    }
    yield SummaryState.requestingSummary(event.source);
    try {
      final jobId = await _jiztRepository.requestSummary(event.source);
      yield SummaryState.waitingToCheckSummaryStatus(jobId);
      _pollingDispatcher.startPolling((count) {
        add(CheckSummaryStatusEvent());
      });
    } on Exception {
      yield const SummaryState.failure();
    }
  }

  Stream<SummaryState> _mapCheckSummaryStatusEventToState(
    SummaryState state,
  ) async* {
    if (state.status != SummaryStatus.waitingToCheckSummaryStatus &&
        state.status != SummaryStatus.checkingSummaryStatus) {
      _pollingDispatcher.stopPolling();
      return;
    }
    if (state.status == SummaryStatus.checkingSummaryStatus) {
      return; // Already checking status
    }
    yield SummaryState.checkingSummaryStatus(state.jobId);
    final summary = await _jiztRepository.getSummary(state.jobId);
    if (summary.state == 'completed') {
      _pollingDispatcher.stopPolling();
      yield SummaryState.success(summary.output);
    } else {
      yield SummaryState.waitingToCheckSummaryStatus(state.jobId);
    }
  }
}

class PollingDispatcher {
  StreamSubscription<int> _pollingSubscription;

  void startPolling(void onPoll(int count)) {
    _pollingSubscription?.cancel();
    _pollingSubscription = Stream.periodic(Duration(seconds: 2), (x) => x + 1)
        .listen((count) => onPoll(count));
  }

  void stopPolling() {
    _pollingSubscription?.cancel();
    _pollingSubscription = null;
  }
}
