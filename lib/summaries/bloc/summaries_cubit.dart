import 'dart:async';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'summaries_state.dart';

class SummariesCubit extends Cubit<SummariesState> {
  final JiztRepository _jiztRepository;
  late StreamSubscription<List<Summary>> summariesSubscription;

  SummariesCubit(this._jiztRepository) : super(SummariesLoadInProgressState());

  void loadSummaries() {
    summariesSubscription = _jiztRepository
        .streamAllSummaries()
        .map((summaries) => summaries
            .where((summary) => summary.status == SummaryStatus.completed)
            .toList(growable: false))
        .map((summaries) => summaries..sort((b, a) => a.compareTo(b)))
        .listen((summaries) => emit(SummariesLoadSuccessState(summaries)));
  }

  @override
  Future<void> close() {
    summariesSubscription.cancel();
    return super.close();
  }
}
