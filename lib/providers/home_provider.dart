import 'package:get/get_connect/connect.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://sandbox.bizharedev.id:17001';
    httpClient.defaultContentType = "application/json";
    super.onInit();
  }

  Future<Response> listBusiness(Map filter) =>
      post('/business/parent/all', filter);
  Future<Response> listCategories() => get('/media/param/business/category');
}
