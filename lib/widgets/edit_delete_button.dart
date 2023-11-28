import 'package:flutter/material.dart';
import 'package:todoapp_localdatabase_hive/constant%20file/const_style.dart';

class buTTons extends StatelessWidget {
  final VoidCallback onpressedEdit;
  final VoidCallback onpresseDelete;
  buTTons({required this.onpressedEdit, required this.onpresseDelete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onpressedEdit,
            icon: Icon(
              Icons.edit,
              color: kcommoncolor,
            ),
          ),
          IconButton(
              onPressed: onpresseDelete,
              icon: Icon(
                Icons.delete,
                color: Colors.deepOrangeAccent,
              ))
        ],
      ),
    );
  }
}
