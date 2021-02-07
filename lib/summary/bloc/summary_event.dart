part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object> get props => [];
}

class SourceSubmittedEvent extends SummaryEvent {
  final String source;

  const SourceSubmittedEvent(this.source);

  @override
  List<Object> get props => [source];
}

class CheckSummaryStatusEvent extends SummaryEvent {}
