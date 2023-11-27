import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Box? todo;
  @override
  void initState() {
    todo = Hive.box('todo');
    super.initState();
  }

  TextEditingController _addTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Starter header message
          Text(
            "Add Your Task",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),

          //input filed
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.white)),
            child: TextField(
              controller: _addTextController,
              decoration: InputDecoration(
                hintText: "Write here..",
                border: InputBorder.none,
              ),
            ),
          ),

          //Add Button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    elevation: 0,

                    padding: EdgeInsets.all(16.0), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Button border radius
                    ),
                  ),
                  onPressed: () async {
                    try {
                      final userInput = _addTextController.text;
                      await todo!.add(userInput);
                      Fluttertoast.showToast(msg: "Note Added");
                      _addTextController.clear();
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  child: Text(
                    "Add Note",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  )),
            ),
          ),

          //main body for showing the notes

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box('todo').listenable(),
              builder: (context, box, widget) {
                return ListView.builder(
                    itemCount: todo!.keys.toList().length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(todo!.getAt(index).toString()),
                        ),
                      );
                    });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
