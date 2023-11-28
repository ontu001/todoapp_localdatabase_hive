import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_localdatabase_hive/constant%20file/const_style.dart';
import 'package:todoapp_localdatabase_hive/widgets/edit_box.dart';
import 'package:todoapp_localdatabase_hive/widgets/edit_delete_button.dart';
import 'package:todoapp_localdatabase_hive/widgets/textfiled.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController _InputController = TextEditingController();
  TextEditingController _editTextController = TextEditingController();
  Box? todo;
  @override
  void initState() {
    todo = Hive.box('todo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading task==========
              Text(
                'Add Your Task',
                style: kcommonTextStyle,
              ),

              //Input filed start=========
              txtFiled(
                controller: _InputController,
                onpressed: () async {
                  try {
                    final userInput = _InputController.text;
                    todo!.add(userInput);
                    Fluttertoast.showToast(msg: 'Added');
                    _InputController.clear();
                  } catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                },
                icon: Icons.add_outlined,
              ),
              //Input filed end=========

              //Notes show body  start=================
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('todo').listenable(),
                  builder: (context, box, Widget) {
                    return ListView.builder(
                      itemCount: todo!.keys.toList().length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              todo!.getAt(index).toString(),
                              style: kNoteStyle,
                            ),

                            //for add edit and delete button
                            trailing: buTTons(
                                //for edit button
                                onpressedEdit: () async {
                              //Popup box for edit field
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return EditboX(
                                      controller: _editTextController,
                                      onpressed: () {
                                        final updatedData =
                                            _editTextController.text;
                                        todo!.putAt(index, updatedData);
                                        _editTextController.clear();
                                        Navigator.pop(context);
                                      },
                                    );
                                  });
                            },
                                //for delete button
                                onpresseDelete: () async {
                              await todo!.deleteAt(index);
                              Fluttertoast.showToast(msg: 'Deleted');
                            }),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              //Notes show body end ====================
            ],
          )),
    );
  }
}
