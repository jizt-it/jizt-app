part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object> get props => [];
}

class LoadSummaryEvent extends SummaryEvent {
  final String id;

  const LoadSummaryEvent(this.id);

  @override
  List<Object> get props => [id];
}
