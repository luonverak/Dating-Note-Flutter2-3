import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_storage/model/note_model.dart';
import 'package:local_storage/view/home_screen.dart';

import '../controller/note_controller.dart';
import '../widget/colors_item.dart';
import '../widget/input_field.dart';

class AddEditScreen extends StatefulWidget {
  AddEditScreen({super.key, this.noteModel});
  NoteModel? noteModel;
  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final title = TextEditingController();

  final description = TextEditingController();

  final time = DateTime.now();

  getData() {
    title.text = widget.noteModel!.title;
    description.text = widget.noteModel!.description;
  }

  @override
  void initState() {
    widget.noteModel == null ? '' : getData();
    super.initState();
  }

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
        title: Text(
          widget.noteModel == null ? "Add note" : "Edit note",
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              widget.noteModel == null
                  ? await NoteController()
                      .insertData(
                        NoteModel(
                          id: Random().nextInt(10000),
                          title: title.text,
                          description: description.text,
                          time: '${time.year}-${time.month}-${time.day}',
                        ),
                      )
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false))
                  : await NoteController()
                      .updateData(
                        NoteModel(
                          id: widget.noteModel!.id,
                          title: title.text,
                          description: description.text,
                          time: '${time.year}-${time.month}-${time.day}',
                        ),
                      )
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false));
            },
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
