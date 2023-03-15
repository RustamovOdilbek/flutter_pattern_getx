import 'package:flutter/material.dart';
import 'package:flutter_pattern_getx/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../views/home_page_post.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemHomePost(_controller.items[index], _controller);
                },
              ),
              _controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox.shrink(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }


}
