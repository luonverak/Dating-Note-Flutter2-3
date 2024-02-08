import 'package:flutter/material.dart';

import '../widget/colors_item.dart';
import '../widget/input_field.dart';

class AddEditScreen extends StatelessWidget {
  AddEditScreen({super.key});
  final title = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Add Note",
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
              color: whiteColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InputField(
                hintText: 'Note Title',
                controller: title,
              ),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Note Description',
                controller: description,
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
