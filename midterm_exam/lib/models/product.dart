import 'package:flutter/cupertino.dart';

class Product{

int id;
String title;
int price;
String  category;
String  description;
 String  image;

 Product({
  required this.id,
  required this.title,
  required this.price,
  required this.category,
  required this.description,
  required this.image,

 });

 factory Product.fromJson(Map<String, dynamic> item){

  return Product(
    id: item['id'],
    title: item['title'],
    price: item['price'],
    category: item['category'],
      description: item['description'],
      image: item['image'],
  );

  
 }

}