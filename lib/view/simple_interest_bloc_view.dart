import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_two/bloc/simple_interest_event.dart';

class SimpleInterestBloc extends Bloc<SimpleInterestEvent, double> {
  SimpleInterestBloc() : super(0.0);

  @override
  Stream<double> mapEventToState(SimpleInterestEvent event) async* {
    if (event is CalculateSimpleInterestEvent) {
      final interest =
          (event.principal * event.rate * event.time) / 100.0; // Formula
      yield interest;
    }
  }
}
