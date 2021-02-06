import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

import 'bloc_observer.dart';
import 'jizt_app.dart';

void main() async {
  Bloc.observer = JiztBlocObserver();
  final jiztApiClient = JiztMockApiClient(); // TODO replace with real api
  final jiztCacheClient = JiztCacheClientImpl(
    box: await JiztHiveBoxProvider.getSummariesBox(),
  );
  final jiztRepository = JiztRepositoryImpl(
    jiztApiClient: jiztApiClient,
    jiztCacheClient: jiztCacheClient,
  );
  runApp(JiztApp(
    jiztRepository: jiztRepository,
  ));
}
