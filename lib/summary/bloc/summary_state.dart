part of 'summary_cubit.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryLoadInProgressState extends SummaryState {}

class SummaryLoadSuccessState extends SummaryState {
  final String id;
  final Summary summary;

  const SummaryLoadSuccessState(this.id, this.summary);

  @override
  List<Object> get props => [summary];
}

class SummaryLoadFailureState extends SummaryState {}

class SummaryRemovedState extends SummaryState {}
