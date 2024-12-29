import 'package:flutter/material.dart';

class StudentListView extends StatefulWidget {
  const StudentListView({super.key});

  @override
  _StudentListViewState createState() => _StudentListViewState();
}

class _StudentListViewState extends State<StudentListView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  String? selectedCity;
  List<Map<String, String>> students = [];

  void addStudent() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        selectedCity != null) {
      setState(() {
        students.add({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'city': selectedCity!,
        });

        // Clear input fields after adding
        firstNameController.clear();
        lastNameController.clear();
        selectedCity = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Form
            const Text(
              'Add a Student',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: const InputDecoration(
                labelText: 'Select Address',
                border: OutlineInputBorder(),
              ),
              items: ['Kathmandu', 'Dang', 'Pokhara', 'Chitwan']
                  .map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 10),

            // Centered Add Student Button
            Center(
              child: ElevatedButton(
                onPressed: addStudent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                ),
                child: const Text('Add Student'),
              ),
            ),

            const SizedBox(height: 20),

            // Student List Section
            Expanded(
              child: students.isEmpty
                  ? const Center(
                      child: Text(
                        'No students added yet.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return Card(
                          color: Colors.teal[50],
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              '${student['firstName']} ${student['lastName']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(student['city']!),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  students.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
