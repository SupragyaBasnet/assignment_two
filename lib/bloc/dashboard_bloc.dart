import 'package:assignment_two/bloc/area_of_circle_bloc.dart';
import 'package:assignment_two/bloc/simple_interest_bloc.dart';
import 'package:assignment_two/bloc/student_list_bloc.dart';
import 'package:assignment_two/view/area_of_circle_view.dart';
import 'package:assignment_two/view/simple_interest_view.dart';
import 'package:assignment_two/view/student_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<void> {
  DashboardBloc(
    this._areaOfCircleBloc,
    this._simpleInterestBloc,
    this._studentListBloc,
  ) : super(null);

  final AreaOfCircleBloc _areaOfCircleBloc;
  final SimpleInterestBloc _simpleInterestBloc;
  final StudentListBloc _studentListBloc;

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: _areaOfCircleBloc,
                child: const AreaOfCircleView(),
              )),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: _simpleInterestBloc,
                child: const SimpleInterestView(),
              )),
    );
  }

  void openStudentListView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _studentListBloc,
                  child: const StudentListView(),
                )));
  }
}
