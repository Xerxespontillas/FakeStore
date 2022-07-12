import 'dart:convert';
import '../models/api_response.dart';
import '../models/product.dart';
import 'package:fake_store/models/login.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://fakestoreapi.com/';

 Future<dynamic> login(String username, String password) async{
  final Auth = Login(username: username, password: password);
    return http
        .post(Uri.parse('$baseUrl/auth/login'), body: Auth.toJson())
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return jsonData;
      }
    }).catchError((err) => print(err));
}

 Future<List<Product>> getAllProducts() async {
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((err) => print(err));
  }

}
