import 'package:get/get.dart';
import 'package:study_case_flutter/models/business.dart';
import 'package:study_case_flutter/models/category.dart';
import 'package:study_case_flutter/providers/home_provider.dart';

class HomeController extends GetxController {
  var size = 12.obs;
  var page = 1.obs;
  var listCategory = [].obs;
  var businessName = "".obs;
  var businessList = [].obs;
  var categories = [].obs;
  HomeProvider homeProvider = Get.put(HomeProvider());

  @override
  void onInit() {
    fetchBusiness(buildFilter());
    super.onInit();
  }

  void updatePage(int s) => size.value = s;
  void updateBusinessName(String s) => businessName.value = s;
  void updateCategory(List<String> categories) =>
      listCategory.value = categories;

  Map buildFilter() {
    var filter = {"size": size.value, "page": page.value, "listCategory": listCategory.value};
    if (businessName.value.isNotEmpty) filter["businessName"] = businessName.value;
    return filter;
  }

  void fetchBusiness(Map filter) {
    homeProvider.listBusiness(filter).then((response) {
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
