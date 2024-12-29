import 'package:assignment_two/app.dart';
import 'package:assignment_two/serviceLocator/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// suru ma ekchoti initialize garni
  await initDependencies();
  runApp(
    const App(),
  );
}
