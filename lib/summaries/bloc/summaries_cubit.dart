import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

part 'summaries_state.dart';

class SummariesCubit extends Cubit<SummariesState> {
  final JiztRepository _jiztRepository;
  StreamSubscription<Map<String, Summary>> summariesSubscription;

  SummariesCubit(this._jiztRepository) : super(SummariesLoadInProgressState());

  void loadSummaries() {
    summariesSubscription = _jiztRepository
        .streamAllSummaries()
        .listen((summaries) => emit(SummariesLoadSuccessState(summaries)));
  }

  @override
  Future<void> close() {
    summariesSubscription.cancel();
    return super.close();
  }
}
