import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  final JiztRepository _jiztRepository;

  SummaryCubit(this._jiztRepository) : super(SummaryLoadInProgressState());

  Future<void> loadSummary(String summaryId) async {
    try {
      final summary = await _jiztRepository.getSummary(summaryId);
      if (summary != null) {
        emit(SummaryLoadSuccessState(summaryId, summary));
      }
    } catch (e) {
      addError(e);
      emit(SummaryLoadFailureState());
    }
  }

  Future<void> deleteSummary() async {
    final currentState = state;
    if (currentState is SummaryLoadSuccessState) {
      try {
        await _jiztRepository.deleteSummary(currentState.id);
        emit(SummaryRemovedState());
      } catch (e) {
        addError(e);
        emit(SummaryLoadFailureState());
      }
    }
  }
}
