import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
  });
  var hintText;
  var maxLines;
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      maxLines: maxLines,
    );
  }
}
