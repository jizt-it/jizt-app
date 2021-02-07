part of 'summaries_bloc.dart';

abstract class SummariesState extends Equatable {
  const SummariesState();

  @override
  List<Object> get props => [];
}

class SummariesLoadInProgressState extends SummariesState {}

class SummariesLoadSuccessState extends SummariesState {
  final Map<String, Summary> summaries;

  const SummariesLoadSuccessState([this.summaries = const {}]);

  @override
  List<Object> get props => [summaries];
}

class SummariesLoadFailureState extends SummariesState {}
