import 'package:assignment_two/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Match color with other views
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          // Area of Circle Card
          Card(
            color: Colors.teal[50], // Light teal background for consistency
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            elevation: 4, // Add elevation for depth
            child: InkWell(
              onTap: () {
                context.read<DashboardBloc>().openAreaOfCircleView(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.circle,
                      size: 48, color: Colors.teal), // Icon for Area of Circle
                  Text(
                    'Area of Circle',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Simple Interest Card
          Card(
            color: Colors.teal[50], // Light teal background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            elevation: 4, // Add elevation for depth
            child: InkWell(
              onTap: () {
                context.read<DashboardBloc>().openSimpleInterestView(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.trending_up,
                      size: 48, color: Colors.teal), // Icon for Simple Interest
                  Text(
                    'Simple Interest',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Student List Card
          Card(
            color: Colors.teal[50], // Light teal background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            elevation: 4, // Add elevation for depth
            child: InkWell(
              onTap: () {
                context.read<DashboardBloc>().openStudentListView(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.person,
                      size: 48, color: Colors.teal), // Icon for Student List
                  Text(
                    'Student List',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
