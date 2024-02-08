import 'package:flutter/material.dart';
import 'package:local_storage/view/add_edit_screen.dart';
import 'package:local_storage/widget/card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Dating Note",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CartItem(),
        ],
      ),
    );
  }
}
