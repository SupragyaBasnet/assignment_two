import 'package:assignment_two/bloc/area_of_circle_bloc.dart';
import 'package:assignment_two/bloc/dashboard_bloc.dart';
import 'package:assignment_two/bloc/simple_interest_bloc.dart';
import 'package:assignment_two/bloc/student_list_bloc.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerLazySingleton(() => AreaOfCircleBloc());
  serviceLocator.registerLazySingleton(() => SimpleInterestBloc());
  serviceLocator.registerLazySingleton(() => StudentListBloc());

  serviceLocator.registerLazySingleton<DashboardBloc>(
    () => DashboardBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
}
