import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color Backgroundcolor;
  final Color textColor;


  const ButtonWidget({super.key,
  required this.Backgroundcolor,
  required this.textColor,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color:Backgroundcolor,
          borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(text,
            style: TextStyle(
              fontSize: 20,
              color:textColor,
            )),
      ),
    );
  }
}
