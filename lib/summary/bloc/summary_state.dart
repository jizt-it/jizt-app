part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryLoadInProgressState extends SummaryState {}

class SummaryLoadSuccessState extends SummaryState {
  final Summary summary;

  const SummaryLoadSuccessState(this.summary);

  @override
  List<Object> get props => [summary];
}

class SummaryLoadFailureState extends SummaryState {}
