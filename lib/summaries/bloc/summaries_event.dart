part of 'summaries_bloc.dart';

abstract class SummariesEvent extends Equatable {
  const SummariesEvent();

  @override
  List<Object> get props => [];
}

class LoadSummariesEvent extends SummariesEvent {}

class SummariesReceivedEvent extends SummariesEvent {
  final Map<String, Summary> summaries;

  SummariesReceivedEvent(this.summaries);

  @override
  List<Object> get props => [summaries];
}
