import 'package:flutter/material.dart';
import 'package:todoapp_localdatabase_hive/widgets/textfiled.dart';

class EditboX extends StatelessWidget {
  final VoidCallback onpressed;
  final TextEditingController? controller;
  EditboX({required this.onpressed, this.controller});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 150,
        child: Column(
          children: [
            txtFiled(
              controller: controller,
              icon: Icons.update,
              onpressed: onpressed,
            )
          ],
        ),
      ),
    );
  }
}
