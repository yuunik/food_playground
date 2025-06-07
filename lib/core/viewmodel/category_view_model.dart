import 'package:get/get.dart';

import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/service/category_request.dart';

class CategoryViewModel extends GetxController {
  List<CategoryModel> categoryList = [];
  var isLoading = false.obs;
  var tipMsg = 'init'.obs;

  CategoryViewModel() {
    getCategoryList();
  }

  getCategoryList() async {
    isLoading.value = true;
    tipMsg.value = 'start';
    try {
      final res = await CategoryRequest.getCategoryList();
      isLoading.value = false;
      categoryList = res;
    } catch (e) {
      isLoading.value = false;
      tipMsg.value = "Network error...";
    }
  }
}