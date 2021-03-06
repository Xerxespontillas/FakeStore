import 'dart:convert';
import '../models/product.dart';
import 'package:fake_store/models/login.dart';
import 'package:http/http.dart' as http;
import'package:fake_store/models/cart.dart';
import 'package:fake_store/models/updating_cart';

class ApiService {
  static const baseUrl = 'https://fakestoreapi.com';

  Future<dynamic> login(String username, String password) {
    final Auth = Login(username: username, password: password);
    return http
        .post(Uri.parse('$baseUrl/auth/login'), body: Auth.toJson())
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return jsonData;
      }
    }).catchError((err) =>print('Error Occurred'));
  }

 Future<List<Product>> getAllProduct() async {
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((err) => print('Error Occurred'));
  }

Future<List<Product>> getProductsByCategory(String categoryName) {
    return http
        .get(Uri.parse('$baseUrl/products/category/$categoryName'))
        .then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((err) =>  print('Error Occurred'));
  }

 Future<List<String>> getAllCategories() {
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      final categories = <String>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var category in jsonData) {
          categories.add(category);
        }
      }
      return categories;
    }).catchError((err) => print('Error Occurred'));
  }
  
 Future<Product?> getProduct(int id) {
    return http.get(Uri.parse('$baseUrl/products/$id')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return Product.fromJson(jsonData);
      }
      return null;
    }).catchError((err) =>  print('Error Occurred'));
  }
  
    Future<Cart?> getCart(String id) {
    return http.get(Uri.parse('$baseUrl/carts/$id')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return Cart.fromJson(jsonData);
      }
      return null;
    }).catchError((err) => print('Error Occurred'));
  }
  Future<void> updateCart(int cartId, int productId) {
    final cartUpdate =
        CartUpdate(userId: cartId, date: DateTime.now(), products: [
      {'productId': productId, 'quantity': 1}
    ]);
    return http
        .put(Uri.parse('$baseUrl/carts/$cartId'),
            body: json.encode(cartUpdate.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    }).catchError((err) =>  print('Error Occurred'));
  }

  Future<void> deleteCart(String cartId) {
    return http.delete(Uri.parse('$baseUrl/carts/$cartId')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    }).catchError((err) =>  print('Error Occurred'));
  }

}
