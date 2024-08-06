import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/student_images.view.dart';
import 'package:flutter/material.dart';

class StudentListView extends StatelessWidget {
  final String testId;

  // Updated list of students with images
  final List<Map<String, dynamic>> students = [
    {
      "name": "Lê Tuấn Anh",
      "score": 85,
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/250"
      ]
    },
    {
      "name": "Lê Hải Anh",
      "score": 100,
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/250"
      ]
    },
    {
      "name": "Tô Hoàng Hải",
      "score": 78,
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/250"
      ]
    },
    {
      "name": "Tô Hoàng Dương",
      "score": 92,
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/250"
      ]
    },
    {
      "name": "Lê Duy Thái",
      "score": 88,
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/250"
      ]
    },
    // Add more student data here...
  ];

  StudentListView({Key? key, required this.testId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách học sinh"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: GlobalColors().mainColor,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  students[index]['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors().mainColor,
                  ),
                ),
                trailing: Text(
                  '${students[index]['score']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ),
                onTap: () {
                  // Navigate to the image view screen with the student's images
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentImagesView(
                        studentName: students[index]['name'],
                        images: students[index]['images'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
