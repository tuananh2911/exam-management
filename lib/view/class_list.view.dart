import 'package:exam_management_app/utils/global.colors.dart';
import 'package:flutter/material.dart';

class ClassListView extends StatelessWidget {
  // Sample list of classes
  final List<Map<String, dynamic>> classes = [
    {"name": "Lớp 7A", "createdAt": "01-09-2020", "studentCount": 40},
    {"name": "Lớp 8A", "createdAt": "01-09-2019", "studentCount": 35},
    {"name": "Lớp 9A", "createdAt": "01-09-2018", "studentCount": 38},
    {"name": "Lớp 10A", "createdAt": "01-09-2017", "studentCount": 42},
    // Add more classes here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách lớp học"),
        backgroundColor: GlobalColors().mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classes[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(
                            height:
                                8.0), // Spacing between title and creation date
                        Text(
                          "${classes[index]['createdAt']}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Sĩ số",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                            height:
                                4.0), // Spacing between "Sĩ số" and the count
                        Text(
                          "${classes[index]['studentCount']}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
