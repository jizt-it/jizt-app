class Poller<T> {
  Future<T> Function(int count) _pollingAction;

  Poller(this._pollingAction);

  Stream<T> poll({int delaySec = 2}) {
    return Stream.periodic(Duration(seconds: delaySec), (x) => x + 1)
        .asyncMap((count) => _pollingAction(count));
  }
}
