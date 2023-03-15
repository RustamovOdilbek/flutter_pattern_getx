import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/https_service.dart';
import '../service/log_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  List<Post> items = [];

  void apiPostList() async {
    isLoading.value = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading.value = false;
  }

  void apiPostDelete(Post post) async {
    isLoading.value = true;

    Network.DELETE(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {apiLoadList(response)});
  }

  apiLoadList(String? response) {
    LogService.e(response.toString());


      LogService.e("response.toString()");
      if (response != null) {
        apiPostList();
      } else {
        isLoading.value = false;
        items = [];
      }
  }

  _updatePost(Post post) {
    // if (title.isNotEmpty) {
    //   post.title = title;
    // }
    // if (body.isNotEmpty) {
    //   post.body = body;
    // }

    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) =>
    {LogService.i(response.toString()), apiLoadList(response)});
  }

}