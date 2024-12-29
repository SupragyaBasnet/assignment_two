import 'package:assignment_two/bloc/area_of_circle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleBlocView extends StatelessWidget {
  const AreaOfCircleBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          mainAxisAlignment: MainAxisAlignment.start, // Keep widgets at the top
          children: [
            const Text(
              'Enter the radius:',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign:
                  TextAlign.center, // Align the text to the center horizontally
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
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final radius = double.tryParse(radiusController.text);
                  if (radius != null && radius >= 0) {
                    context
                        .read<AreaOfCircleBloc>()
                        .add(CalculateAreaEvent(radius));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid radius!')),
                    );
                  }
                },
                child: Center(child: const Text('Calculate Area')),
              ),
            ),
            const SizedBox(height: 20.0),
            BlocBuilder<AreaOfCircleBloc, double>(
              builder: (context, area) {
                return Center(
                  child: Text(
                    'Area: area',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign:
                        TextAlign.center, // Center align the text horizontally
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
