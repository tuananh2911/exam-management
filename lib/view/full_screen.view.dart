import 'package:flutter/material.dart';

class FullScreenImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  FullScreenImageView({Key? key, required this.images, required this.initialIndex})
      : super(key: key);

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.network(
              widget.images[currentIndex],
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('Image not available', style: TextStyle(color: Colors.white)));
              },
            ),
          ),
          Positioned(
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (currentIndex > 0) {
                    currentIndex--;
                  }
                });
              },
            ),
          ),
          Positioned(
            right: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (currentIndex < widget.images.length - 1) {
                    currentIndex++;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
