import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../model/post_model.dart';

openAlertBox(Post post, BuildContext context) {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  titleController.text = post!.title!;
  bodyController.text = post!.body!;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 250.0,
            height: 350,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Title',
                      hintText: 'Enter Your Title'),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: post.body),
                ),
                SizedBox(
                  height: 50,
                ),
                new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  color: Colors.blue,
                  child: new Text("Update post",
                      style:
                          new TextStyle(fontSize: 16.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Get.find<MainController>().updatePost(
                        post,
                        titleController.text.toString(),
                        bodyController.text.toString());
                  },
                ),
              ],
            ),
          ),
        );
      });
}
