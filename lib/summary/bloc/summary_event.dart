part of 'summary_bloc.dart';

abstract class SummaryEvent {
  const SummaryEvent();
}

class SourceSubmittedEvent extends SummaryEvent {
  final String source;

  const SourceSubmittedEvent(this.source);
}

class CheckSummaryStatusEvent extends SummaryEvent {}
