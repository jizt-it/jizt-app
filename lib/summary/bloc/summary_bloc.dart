import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final JiztRepository _jiztRepository;

  SummaryBloc(this._jiztRepository) : super(SummaryLoadInProgressState());

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is LoadSummaryEvent) {
      yield* _mapLoadSummaryEventToState(event, state);
    }
  }

  Stream<SummaryState> _mapLoadSummaryEventToState(
    LoadSummaryEvent event,
    SummaryState state,
  ) async* {
    try {
      final summary = await _jiztRepository.getSummary(event.id);
      yield SummaryLoadSuccessState(summary);
    } catch (_) {
      yield SummaryLoadFailureState();
    }
  }
}
