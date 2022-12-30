import 'package:sparrow_shop/Models/Product.dart';
import 'package:sparrow_shop/Respository/Helper/APIConfig.dart';
import 'package:sparrow_shop/Respository/Helper/APIProvider.dart';

class ProductRepository {

  APIProvider apiProvider = APIProvider();

  Future<List<Product>> fetchProducts() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await apiProvider.get(APIConfig.productUrl, headers);
    return productList(response);
  }
}
