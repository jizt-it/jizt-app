import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'summaries_event.dart';
part 'summaries_state.dart';

class SummariesBloc extends Bloc<SummariesEvent, SummariesState> {
  final JiztRepository _jiztRepository;
  StreamSubscription<Map<String, Summary>> summariesSubscription;

  SummariesBloc(this._jiztRepository) : super(SummariesLoadInProgressState());

  @override
  Stream<SummariesState> mapEventToState(SummariesEvent event) async* {
    if (event is LoadSummariesEvent) {
      yield* _mapLoadSummariesEventToState(event, state);
    } else if (event is SummariesReceivedEvent) {
      yield* _mapSummariesReceivedEventToState(event, state);
    }
  }

  Stream<SummariesState> _mapLoadSummariesEventToState(
    LoadSummariesEvent event,
    SummariesState state,
  ) async* {
    summariesSubscription =
        _jiztRepository.streamAllSummaries().listen((summaries) {
      add(SummariesReceivedEvent(summaries));
    });
  }

  Stream<SummariesState> _mapSummariesReceivedEventToState(
    SummariesReceivedEvent event,
    SummariesState state,
  ) async* {
    yield SummariesLoadSuccessState(event.summaries);
  }

  @override
  Future<void> close() {
    summariesSubscription.cancel();
    return super.close();
  }
}
