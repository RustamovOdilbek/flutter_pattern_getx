
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/post_model.dart';
import '../service/https_service.dart';
import '../service/log_service.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;


  createPost(String title, String body, BuildContext context)async{
    var post = Post(title: title, body: body, userId: 1001);

    isLoading.value = true;

    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      LogService.i(response.toString()),
      isLoading.value = false,
      Navigator.pop(context)
    });
  }

}