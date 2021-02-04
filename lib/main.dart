import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'jizt_app.dart';

void main() {
  Bloc.observer = JiztBlocObserver();
  runApp(JiztApp());
}
