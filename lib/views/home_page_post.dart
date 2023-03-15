
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pattern_getx/controllers/home_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post_model.dart';

Widget itemHomePost(Post post, HomeController _controller) {
  return Slidable(
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        )
      ],
    ),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            _controller.apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        )
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          Text(post.title!.toUpperCase()),
          SizedBox(
            height: 5,
          ),
          Text(post.body!)
        ],
      ),
    ),
  );
}