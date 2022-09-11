import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<dynamic> categories = [];
  List<dynamic> categoryDetails = [];
  List<dynamic>? category;

  @override
  onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    try {
      final response = await Dio().get(
        "https://phplaravel-704365-2879244.cloudwaysapps.com/api/jawan_pakistan",
      );
      categories = response.data["data"];
      update(["category"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }

  getCategoryDetails(String category) async {
    try {
      final response = await Dio().get(
        "https://phplaravel-704365-2879244.cloudwaysapps.com/api/jawan_pakistan/$category",
      );
      categoryDetails = response.data["data"];
      update(["categoryDetails"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }

  getSpeceficCategory(String categoryName, int id) async {
    try {
      final response = await Dio().get(
        "https://phplaravel-704365-2879244.cloudwaysapps.com/api/jawan_pakistan/$categoryName/$id",
      );
      category = response.data["data"];
      update(["category"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }
}
