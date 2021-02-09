part of 'new_summary_bloc.dart';

abstract class NewSummaryEvent extends Equatable {
  const NewSummaryEvent();

  @override
  List<Object> get props => [];
}

class SourceSubmittedEvent extends NewSummaryEvent {
  final String source;

  const SourceSubmittedEvent(this.source);

  @override
  List<Object> get props => [source];
}

class CheckNewSummaryStatusEvent extends NewSummaryEvent {}

class ResetEvent extends NewSummaryEvent {}
