import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    elevation: 0,

                    padding: EdgeInsets.all(16.0), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Button border radius
                    ),
                  ),
                  onPressed: () {},
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
            child: Container(
              color: Colors.amber,
            ),
          ),
        ]),
      ),
    );
  }
}
