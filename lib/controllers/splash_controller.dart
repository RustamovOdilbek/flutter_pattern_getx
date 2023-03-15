
import 'package:flutter_pattern_getx/service/https_service.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';

class SplashControll extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList()async{
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items.value = Network.parsePostList(response);
    }else{
      items.value = [];
    }
    isLoading.value = false;
  }

  void apiPostDelete(Post post) async{
    isLoading.value = true;
    var response = Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
    isLoading.value = false;
  }
}