import 'package:exam_management_app/utils/global.colors.dart';
import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonGlobal({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: GlobalColors().mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

