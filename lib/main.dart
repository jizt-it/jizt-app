import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jizt_repository/jizt_repository.dart';

import 'app/jizt_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString());
    log(details.stack.toString());
  };

  final jiztApiClient = JiztApiClientImpl();
  final jiztCacheClient = JiztCacheClientImpl(
    box: await JiztHiveBoxProvider.getSummariesBox(),
  );
  final jiztRepository = JiztRepositoryImpl(
    jiztApiClient: jiztApiClient,
    jiztCacheClient: jiztCacheClient,
  );

  runZonedGuarded(
    () => runApp(JiztApp(jiztRepository: jiztRepository)),
    (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
    },
  );
}
