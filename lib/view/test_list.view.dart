import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/student.view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this line to import the intl package

class TestListView extends StatelessWidget {
  final String className;

  TestListView({required this.className});

  final List<Map<String, dynamic>> tests = [
    {"title": "Bài kiểm tra 1", "date": "14-01-2018", "count": 30},
    {"title": "Bài kiểm tra 2", "date": "14-01-2018", "count": 40},
    // Add more tests for the specific class
  ];

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests of $className"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: Container(
              height: 80, // Same height for consistency
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text(
                  tests[index]['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors().mainColor,
                  ),
                ),
                subtitle: Text(
                  tests[index]['date'],
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Số câu'),
                    Text(tests[index]['count'].toString()),
                  ],
                ),
                onTap: () {
                  // Navigate to student list view
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListView(
                        testId: tests[index]['title'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
