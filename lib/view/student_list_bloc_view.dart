import 'package:flutter/material.dart';

class StudentListBlocView extends StatefulWidget {
  const StudentListBlocView({super.key});

  @override
  _StudentListBlocViewState createState() => _StudentListBlocViewState();
}

class _StudentListBlocViewState extends State<StudentListBlocView> {
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
        title: const Text('Student List and Add Student'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Form
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
            ElevatedButton(
              onPressed: addStudent,
              child: const Text('Add Student'),
            ),
            const SizedBox(height: 20),

            // Student List
            // const Text(
            //   'Student List:',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 10),
            Expanded(
              child: students.isEmpty
                  ? const Center(child: Text('No students added yet.'))
                  : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                                '${student['firstName']} ${student['lastName']}'),
                            subtitle: Text(student['city']!),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
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
