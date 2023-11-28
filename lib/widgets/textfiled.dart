import 'package:flutter/material.dart';
import 'package:todoapp_localdatabase_hive/constant%20file/const_style.dart';

class txtFiled extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onpressed;
  final IconData icon;
  txtFiled({this.controller, this.onpressed, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 17.0, left: 5.5),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: kcommoncolor,
            width: 6.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: 'Write Here...',
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: onpressed,
                icon: Icon(
                  icon,
                  color: kcommoncolor,
                ),
              )),
        ),
      ),
    );
  }
}
