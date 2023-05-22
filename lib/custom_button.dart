import 'package:flutter/material.dart';

class CustomOperationButton extends StatelessWidget {
  final String title;
  final Function() operation;
  const CustomOperationButton(
      {super.key, required this.title, required this.operation});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: operation,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black26),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
