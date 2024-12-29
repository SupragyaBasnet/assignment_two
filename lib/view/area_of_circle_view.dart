import 'package:assignment_two/bloc/area_of_circle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
        backgroundColor: Colors.teal, // Consistent app bar color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter the radius:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: radiusController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Radius',
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
                ElevatedButton(
                  onPressed: () {
                    final radius = double.tryParse(radiusController.text);
                    if (radius != null && radius >= 0) {
                      context
                          .read<AreaOfCircleBloc>()
                          .add(CalculateAreaEvent(radius));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid radius!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Match color with theme
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Calculate Area'),
                ),
                const SizedBox(height: 20.0),
                BlocBuilder<AreaOfCircleBloc, double>(
                  builder: (context, area) {
                    return Text(
                      'Area: ${area.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
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
