part of 'summaries_bloc.dart';

abstract class SummariesEvent extends Equatable {
  const SummariesEvent();

  @override
  List<Object> get props => [];
}

class LoadSummariesEvent extends SummariesEvent {}
