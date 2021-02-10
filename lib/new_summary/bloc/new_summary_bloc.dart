import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt/utils/poller.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'new_summary_event.dart';
part 'new_summary_state.dart';

class NewSummaryCubit extends Cubit<NewSummaryState> {
  final JiztRepository _jiztRepository;
  StreamSubscription<Summary> pollerSubscription;

  NewSummaryCubit(this._jiztRepository)
      : super(const NewSummaryState.initial());

  Future<void> requestNewSummary(String source) async {
    if (state.status != NewSummaryStatus.initial || source.isEmpty) {
      emit(NewSummaryState.initial());
      return;
    }
    emit(NewSummaryState.requestingSummary(source));
    try {
      final summaryId = await _jiztRepository.requestSummary(source);
      _checkNewSummaryStatus(source, summaryId);
    } on Exception {
      emit(NewSummaryState.failure());
    }
  }

  void _checkNewSummaryStatus(String source, String summaryId) {
    emit(NewSummaryState.waitingToCheckNewSummaryStatus(source, summaryId));
    pollerSubscription = Poller((_) => _jiztRepository.getSummary(summaryId))
        .poll()
        .listen((summary) async => await _onNewSummaryStatusReceived(summary));
  }

  Future<void> _onNewSummaryStatusReceived(Summary summary) async {
    if (state.status == NewSummaryStatus.checkingNewSummaryStatus) {
      return; // Already checking status
    }
    emit(NewSummaryState.checkingNewSummaryStatus(
        state.source, state.summaryId));
    final summary = await _jiztRepository.getSummary(state.summaryId);
    if (summary.status == Status.completed) {
      pollerSubscription.cancel();
      emit(NewSummaryState.success(state.source, state.summaryId));
    } else {
      emit(NewSummaryState.waitingToCheckNewSummaryStatus(
        state.source,
        state.summaryId,
      ));
    }
  }

  Future<void> reset() async {
    emit(NewSummaryState.initial());
  }
}
