import 'package:exam_management_app/view/full_screen.view.dart';
import 'package:flutter/material.dart';

class StudentImagesView extends StatelessWidget {
  final String studentName;
  final List<String> images;

  StudentImagesView({Key? key, required this.studentName, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ảnh của $studentName"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two images per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to full screen image view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImageView(
                      images: images,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Image not available'));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
