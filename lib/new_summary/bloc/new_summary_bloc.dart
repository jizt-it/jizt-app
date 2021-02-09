import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'new_summary_event.dart';
part 'new_summary_state.dart';

class NewSummaryBloc extends Bloc<NewSummaryEvent, NewSummaryState> {
  final JiztRepository _jiztRepository;
  final PollingDispatcher _pollingDispatcher = PollingDispatcher();

  NewSummaryBloc(this._jiztRepository) : super(const NewSummaryState.initial());

  @override
  Stream<NewSummaryState> mapEventToState(NewSummaryEvent event) async* {
    if (event is SourceSubmittedEvent) {
      yield* _mapSourceSubmittedEventToState(event, state);
    } else if (event is CheckNewSummaryStatusEvent) {
      yield* _mapCheckNewSummaryStatusEventToState(state);
    } else if (event is ResetEvent) {
      yield* _mapResetEventToState(state);
    }
  }

  Stream<NewSummaryState> _mapSourceSubmittedEventToState(
    SourceSubmittedEvent event,
    NewSummaryState state,
  ) async* {
    if (state.status != NewSummaryStatus.initial || event.source.isEmpty) {
      yield const NewSummaryState.initial();
      return;
    }
    yield NewSummaryState.requestingSummary(event.source);
    try {
      final jobId = await _jiztRepository.requestSummary(event.source);
      yield NewSummaryState.waitingToCheckNewSummaryStatus(event.source, jobId);
      _pollingDispatcher.startPolling((count) {
        add(CheckNewSummaryStatusEvent());
      });
    } on Exception {
      yield const NewSummaryState.failure();
    }
  }

  Stream<NewSummaryState> _mapCheckNewSummaryStatusEventToState(
    NewSummaryState state,
  ) async* {
    if (state.status != NewSummaryStatus.waitingToCheckNewSummaryStatus &&
        state.status != NewSummaryStatus.checkingNewSummaryStatus) {
      _pollingDispatcher.stopPolling();
      return;
    }
    if (state.status == NewSummaryStatus.checkingNewSummaryStatus) {
      return; // Already checking status
    }
    yield NewSummaryState.checkingNewSummaryStatus(state.source, state.jobId);
    final summary = await _jiztRepository.getSummary(state.jobId);
    if (summary.status == Status.completed) {
      _pollingDispatcher.stopPolling();
      yield NewSummaryState.success(state.source, state.jobId);
    } else {
      yield NewSummaryState.waitingToCheckNewSummaryStatus(
        state.source,
        state.jobId,
      );
    }
  }

  Stream<NewSummaryState> _mapResetEventToState(
    NewSummaryState state,
  ) async* {
    yield NewSummaryState.initial();
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
