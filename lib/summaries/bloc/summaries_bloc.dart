import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'summaries_event.dart';
part 'summaries_state.dart';

class SummariesBloc extends Bloc<SummariesEvent, SummariesState> {
  final JiztRepository _jiztRepository;

  SummariesBloc(this._jiztRepository) : super(SummariesLoadInProgressState());

  @override
  Stream<SummariesState> mapEventToState(SummariesEvent event) async* {
    if (event is LoadSummariesEvent) {
      yield* _mapLoadSummariesEventToState(event, state);
    }
  }

  Stream<SummariesState> _mapLoadSummariesEventToState(
    LoadSummariesEvent event,
    SummariesState state,
  ) async* {
    try {
      final summaries = await _jiztRepository.getAllSummaries();
      yield SummariesLoadSuccessState(summaries);
    } catch (_) {
      yield SummariesLoadFailureState();
    }
  }
}
