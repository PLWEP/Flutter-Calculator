import 'package:flutter/material.dart';

class CustomOperationButton extends StatelessWidget {
  final String title;
  final Function() operation;
  const CustomOperationButton(
      {super.key, required this.title, required this.operation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: operation,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
