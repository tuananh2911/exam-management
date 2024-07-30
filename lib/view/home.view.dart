import 'package:exam_management_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:exam_management_app/utils/global.colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {"title": "Bài kiểm tra 1", "date": "14-Th1-2018", "count": 30},
    {"title": "Bài kiểm tra 2", "date": "14-Th1-2018", "count": 40},
    {"title": "Bài kiểm tra 3", "date": "14-Th1-2018", "count": 80},
    {"title": "Bài kiểm tra 4", "date": "14-Th1-2018", "count": 20},
    {"title": "Bài kiểm tra 5", "date": "14-Th1-2018", "count": 40},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LOGO),
        backgroundColor: GlobalColors().mainColor,
      ),
      drawer: Drawer(
        child: SafeArea( // Bọc Drawer trong SafeArea
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
                      LOGO,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      EMAIL ?? '',
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
                  // Xử lý khi nhấn vào Home
                },
              ),
              ListTile(
                leading: const Icon(Icons.class_),
                title: Text('Lớp học'),
                onTap: () {
                  // Xử lý khi nhấn vào Home
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Cài đặt'),
                onTap: () {
                  // Xử lý khi nhấn vào Settings
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Đăng xuất'),
                onTap: () {
                  // Xử lý khi nhấn vào Logout
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                items[index]['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ngày tạo'),
                  Text(items[index]['date']),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Số câu'),
                  Text(items[index]['count'].toString()),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Xử lý khi nhấn vào nút cộng
        },
        child: Icon(Icons.add),
        backgroundColor: GlobalColors().mainColor,
      ),
    );
  }
}
