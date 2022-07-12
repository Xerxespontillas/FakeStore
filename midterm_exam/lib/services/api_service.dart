import 'dart:convert';

import '../models/api_response.dart';
import '../models/product.dart';
import 'package:fake_store/models/login.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://fakestoreapi.com/';

  static const headers = {
    'token': "eyJhbGciOiJIUzI1NiIsInR",
    'Content-Type': 'application/json'
  };

 Future<dynamic> login(String username, String password) async{
    return http.get(Uri.parse('$baseUrl/users1'), headers: headers).then((data){
      if(data.statusCode==200){
        final jsonData = json.decode(data.body);
        return jsonData;
      }
    return APIResponse<Login>(error: true, errorMessage: 'An error occurred');
    }).catchError((_) =>
            APIResponse<Login>(error: true, errorMessage: 'Error occurred'));
}



 /* Future<APIResponse<List<Product>>> getAllCategories() {
    return http.get(Uri.parse('$baseUrl/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final products = <Product>[];
        for (var item in jsonData) {
          products.add(Product.fromJson(item));
        }
        return APIResponse<List<Product>>(data: products);
      }
      return APIResponse<List<Product>>(
          error: true, errorMessage: 'An error occurred');
    }).catchError((_) => APIResponse<List<Product>>(
        error: true, errorMessage: 'Error occurred'));
  }*/

}
