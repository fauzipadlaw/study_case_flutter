import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_case_flutter/models/business.dart';
import 'package:study_case_flutter/models/category.dart';
import 'package:study_case_flutter/providers/home_provider.dart';

class HomeController extends GetxController {
  var size = 12.obs;
  var page = 1.obs;
  var listCategory = [].obs;
  var businessList = [].obs;
  var categories = [].obs;
  final searchTextController = TextEditingController();
  HomeProvider homeProvider = Get.put(HomeProvider());

  @override
  void onInit() {
    fetchBusiness();
    super.onInit();
  }

  void updatePage(int s) => size.value = s;

  void updateCategory(List<String> categories) =>
      listCategory.value = categories;

  bool isCheckedCategory(String c) => listCategory.value.contains(c);

  Map buildFilter() {
    var filter = {
      "size": size.value,
      "page": page.value,
      "listCategory": listCategory.value
    };
    if (searchTextController.text.isNotEmpty) {
      filter["businessName"] = searchTextController.text;
    }
    return filter;
  }

  void fetchBusiness() {
    homeProvider.listBusiness(buildFilter()).then((response) {
      if (response.statusCode == 200) {
        businessList.value = List<Business>.from(response.body["data"]
                ["content"]
            .map((model) => Business.fromJson(model)));
      } else {
        Get.snackbar("Error ${response.statusCode}",
            "Galat mendapat daftar bisnis. ${response.statusCode}",
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  void fetchCategories() {
    homeProvider.listCategories().then((response) {
      if (response.statusCode == 200) {
        categories.value = List<Category>.from(
            response.body["data"].map((model) => Category.fromJson(model)));
      } else {
        Get.snackbar("Error ${response.statusCode}",
            "Galat mendapat daftar kategori bisnis. Silakan Coba lagi.",
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
