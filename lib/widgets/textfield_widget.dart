import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;
  const TextfieldWidget(
      {super.key,
      required this.textController,
      required this.hintText,
      this.borderRadius=30,
      this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 229, 231, 235),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ))),
    );
  }
}
