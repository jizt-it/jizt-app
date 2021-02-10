import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

import 'jizt_app.dart';
import 'utils/bloc_observer.dart';

void main() async {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = JiztBlocObserver();
  final jiztApiClient = JiztApiClientImpl();
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
