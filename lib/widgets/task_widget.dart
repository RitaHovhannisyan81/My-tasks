import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color? color;
  const TaskWidget({super.key, this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 142, 145, 153)
          ),
        ),
      ),
    );
  }
}
