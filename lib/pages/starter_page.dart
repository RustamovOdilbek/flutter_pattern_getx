import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/starter_controller.dart';
import '../views/item_starter_post.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    super.initState();
    Get.find<StarterController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starter"),
      ),
      body: GetBuilder<StarterController>(
        init: StarterController(),
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemsStarterPost(controller, controller.items[index]);
                },
              ),
              controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
