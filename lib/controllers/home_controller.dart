import 'package:get/get.dart';
import 'package:study_case_flutter/models/business.dart';
import 'package:study_case_flutter/models/category.dart';
import 'package:study_case_flutter/providers/home_provider.dart';

class HomeController extends GetxController {
  var filter = {"size": 12, "page": 1, "listCategory": []}.obs;
  var businessList = [].obs;
  var categories = [].obs;
  HomeProvider homeProvider = Get.put(HomeProvider());

  @override
  void onInit() {
    fetchBusiness(filter);
    fetchCategories();
    super.onInit();
  }

  void fetchBusiness(Map filter) {
    homeProvider.listBusiness(filter).then((response) {
      print("response ${response.statusCode}");
      if(response.statusCode == 200) {
        businessList.value = List<Business>.from(response.body["data"]["content"]
            .map((model) => Business.fromJson(model)));
      } else {
        Get.snackbar("Error ${response.statusCode}", "Galat mendapat daftar bisnis. ${response.statusCode}", snackPosition: SnackPosition.BOTTOM);
      }

    });
  }

  void fetchCategories() {
    homeProvider.listCategories().then((response) {
      print("response ${response.statusCode}");
      if(response.statusCode == 200) {
        categories.value = List<Category>.from(
            response.body["data"].map((model) => Category.fromJson(model)));
      } else {
        Get.snackbar("Error ${response.statusCode}", "Galat mendapat daftar kategori bisnis. Silakan Coba lagi.", snackPosition: SnackPosition.BOTTOM);
      }

    });
  }
}
