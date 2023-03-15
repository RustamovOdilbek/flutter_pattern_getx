import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/create_controller.dart';

class CreatePage extends StatefulWidget {
  static final String id = "create_page";

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Create Post"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:  Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Title',
                  hintText: 'Enter Your Title'
              ),
            ),

            SizedBox(height: 50,),

            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Body',
                  hintText: 'Enter Your Body'
              ),
            ),

            SizedBox(height: 50,),

            new MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              minWidth: 200.0,
              height: 35,
              color: Colors.blue,
              child: new Text('Add Post',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: () {
                Get.find<CreateController>().createPost(titleController.text.toString(), bodyController.text.toString(), context);
              },
            ),
          ],
        ),
      )
    );
  }
}
