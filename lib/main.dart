import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = JiztBlocObserver();
  runApp(JiztApp());
}
