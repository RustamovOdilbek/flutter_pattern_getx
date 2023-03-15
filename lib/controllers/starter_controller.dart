
import 'package:flutter_pattern_getx/service/https_service.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';

class StarterController extends GetxController{

  var isLoading = false;
  var items = [];

  void apiPostList() async{
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items = Network.parsePostList(response);
    }else{
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostDelete(Post post){
    isLoading = true;
    update();

    var response = Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    if(response != null){
      apiPostList();
    }
    isLoading = false;
    update();
  }

}