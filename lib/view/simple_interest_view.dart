import 'package:assignment_two/bloc/simple_interest_bloc.dart';
import 'package:assignment_two/bloc/simple_interest_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        backgroundColor: Colors.teal, // Consistent with other views
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: principalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Principal Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: rateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Rate of Interest (%)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: timeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Time (Years)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SimpleInterestBloc, double>(
                  builder: (context, state) {
                    return Text(
                      'Calculated Interest: Rs.${state.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final double principal =
                        double.tryParse(principalController.text) ?? 0;
                    final double rate =
                        double.tryParse(rateController.text) ?? 0;
                    final double time =
                        double.tryParse(timeController.text) ?? 0;

                    context.read<SimpleInterestBloc>().add(
                          CalculateSimpleInterestEvent(
                            principal: principal,
                            rate: rate,
                            time: time,
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Match button color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Calculate'),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
