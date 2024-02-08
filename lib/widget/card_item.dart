import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../view/add_edit_screen.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditScreen(),
                  ),
                );
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
              label: 'Delete',
            ),
          ],
        ),
        child: const SizedBox(
          width: double.infinity,
          child: Card(
            color: Color.fromARGB(255, 234, 234, 234),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note Title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('Note description'),
                  Text('date time'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
