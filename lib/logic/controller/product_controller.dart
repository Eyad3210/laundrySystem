import 'package:get/get.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/models/order.dart';
import 'package:project2/models/product.dart';
import 'package:project2/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productListGet = <Product>[].obs;

  var productListGet1 = <Product>[].obs;
  var productListGet2 = <Product>[].obs;
  var productListGet3 = <Product>[].obs;

  var productListOrder = <Product>[].obs;
  var remote = RemoteServices();

  @override
  void onInit() {}

  void fetchProducts(laundryId) async {
    try {
      isLoading(true);
      var products = await remote.fetchProducts(laundryId);
      if (products != null) {
        productListGet.value = products;
        for (var i = 0; i < productListGet.length; i++) {
          if (productListGet[i].serviceTypeId == 1)
            productListGet1.add(productListGet[i]);
          update();

          if (productListGet[i].serviceTypeId == 2)
            productListGet2.add(productListGet[i]);
          update();

          if (productListGet[i].serviceTypeId == 3)
            productListGet3.add(productListGet[i]);

          update();
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsOrder(orderId) async {
    try {
      isLoading(true);
      var products = await remote.fetchOrdersInfo(orderId);
      if (products != null) {
        productListOrder.value = products;
        
      }
    } finally {
      isLoading(false);
    }
  }
}
