import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/student.view.dart';
import 'package:exam_management_app/view/test_list.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isViewingClasses = false; // Track if we are viewing classes

  final List<Map<String, dynamic>> tests = [
    {
      "title": "Bài kiểm tra 1",
      "date": "14-01-2018",
      "count": 30,
      "class": "7A"
    },
    {
      "title": "Bài kiểm tra 2",
      "date": "14-01-2018",
      "count": 40,
      "class": "8A"
    },
    {
      "title": "Bài kiểm tra 3",
      "date": "14-01-2018",
      "count": 80,
      "class": "9A"
    },
    {
      "title": "Bài kiểm tra 4",
      "date": "14-01-2018",
      "count": 20,
      "class": "6A"
    },
    {
      "title": "Bài kiểm tra 5",
      "date": "14-01-2018",
      "count": 40,
      "class": "10A"
    },
  ];

  final List<Map<String, dynamic>> classes = [
    {"name": "Lớp 7A", "date": "01-09-2020", "studentCount": 40},
    {"name": "Lớp 8A", "date": "01-09-2019", "studentCount": 35},
    {"name": "Lớp 9A", "date": "01-09-2018", "studentCount": 38},
    {"name": "Lớp 10A", "date": "01-09-2017", "studentCount": 42},
  ];

  // Date format for consistency
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MarkEasy"),
        backgroundColor: GlobalColors().mainColor,
      ),
      drawer: _buildDrawer(),
      body: isViewingClasses ? _buildClassListView() : _buildTestListView(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: GlobalColors().mainColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MarkEasy",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "tuananhle699@gmail.com",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: Text('Bài kiểm tra'),
              onTap: () {
                setState(() {
                  isViewingClasses = false; // Switch to viewing tests
                });
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.class_),
              title: Text('Lớp học'),
              onTap: () {
                setState(() {
                  isViewingClasses = true; // Switch to viewing classes
                });
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
              onTap: () {
                // Handle settings navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Đăng xuất'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestListView() {
    return ListView.builder(
      itemCount: tests.length,
      itemBuilder: (context, index) {
        // Corrected date parsing
        DateTime parsedDate = dateFormat.parse(tests[index]['date']);

        return _buildUniformCard(
          child: ListTile(
            title: Text(
              tests[index]['title'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: GlobalColors().mainColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lớp học: ' + tests[index]['class'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  dateFormat.format(parsedDate),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
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
        );
      },
    );
  }

  Widget _buildClassListView() {
    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        // Corrected date parsing
        DateTime parsedDate = dateFormat.parse(classes[index]['date']);

        return _buildUniformCard(
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
                        color: GlobalColors().mainColor,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      dateFormat.format(parsedDate),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 4.0),
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
            onTap: () {
              // Navigate to the test list view for the selected class
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestListView(
                    className: classes[index]['name'],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildUniformCard({required Widget child}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Container(
        height: 80, // Reduced height for a more compact row
        width: double.infinity, // Full width
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
