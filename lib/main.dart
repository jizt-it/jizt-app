import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jizt_repository/jizt_repository.dart';

import 'bloc_observer.dart';
import 'jizt_app.dart';

void main() {
  Bloc.observer = JiztBlocObserver();
  runApp(JiztApp(
    jiztRepository: JiztMockRepository(), // TODO replace with real repository
  ));
}
