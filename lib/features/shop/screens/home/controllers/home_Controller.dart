import 'package:get/get.dart';
import 'package:tamago_store/features/shop/models/category_model.dart';
import 'package:tamago_store/features/shop/models/product.dart';
import '../../../../../utils/services/api_service.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  var categories = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    fetchCategories();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await ApiService().fetchAllProducts();
      print("fetched products: $fetchedProducts");
      products.assignAll(fetchedProducts);
    } catch (e) {
      print("fetch products error: $e");
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading(false);
    }
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var fetchedCategories = await ApiService().fetchCategories();
      print("fetched categories: $fetchedCategories");
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print("fetch categories error: $e");
      Get.snackbar('Error', 'Failed to load categories');
    } finally {
      isLoading(false);
    }
  }

  static HomeController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    print("index: $index");
    carouselCurrentIndex.value = index;
  }
}
