import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/https_service.dart';
import '../service/log_service.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading.value = false;
  }

  void apiPostDelete(Post post) async {
    isLoading.value = true;
    var response = await Network.DELETE(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
  }

  updatePost(Post post, String title, String body) {
    if (title.isNotEmpty) {
      post.title = title;
    }
    if (body.isNotEmpty) {
      post.body = body;
    }

    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
          LogService.i(response.toString()),
          apiPostList()
        });
  }
}
