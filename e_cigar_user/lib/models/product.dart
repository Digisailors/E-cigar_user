// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:e_cigar_user/Services/db.dart';
import 'package:e_cigar_user/models/shop.dart';


Product shopFromJson(String str) => Product.fromJson(json.decode(str));

String shopToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.sku,
    required this.name,
    required this.mrp,
    required this.shopRef,
    required this.categoryList,

    this.description,
    this.stock = 0,
    this.imageUrl,
    this.brand,
    this.discount = 0,
    this.availability = true,
    this.specification,
    this.reviews,
  });

  String sku;
  String name;
  String? description;
  String shopRef;
  List<String> categoryList;
  int stock;
  String? imageUrl;
  String? brand;
  double mrp;
  double? discount;
  bool availability;
  Map<String, dynamic>? specification;
  List<Review>? reviews;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        shopRef: json["shopRef"],
        categoryList: List<String>.from(json["categoryList"].map((x) => x)),
        stock: json["stock"],
        imageUrl: json["imageUrl"],
        brand: json["brand"],
        mrp: json["mrp"].toDouble(),
        discount: json["discount"],
        availability: json["availability"],
        specification: json["specification"],
        reviews: json["reviews"]!=null ?
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))) : null,
      );

  Map<String, dynamic> toJson() => {
        "sku": sku,
        "name": name,
        "description": description,
        "shopRef": shopRef,
        "categoryList": List<dynamic>.from(categoryList.map((x) => x)),
        "stock": stock,
        "imageUrl": imageUrl,
        "brand": brand,
        "mrp": mrp,
        "discount": discount,
        "availability": availability,
        "specification": specification,
        "reviews": reviews != null
            ? List<dynamic>.from(reviews!.map((x) => x.toJson()))
            : null,
      };

  changeAvailability(){
    availability = !availability;
    updateProduct();
  }

  double get price => mrp - mrp*(discount!/100);

  updateProduct() async {
    await updateProductInDatabase(this);
  }

 static List<Product> getDumPrdoducts(int category){
    if(category == 1){
      return getDummyProducts();
    } else {
      return getDummyStarterProducts();
    }
  }
  static List<Product> getDummyProducts(){
    List<Product> products = []; 
    var random = Random();
    products.add(Product(name: "blue VAPE",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "outlet",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "regret",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "score",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "volume",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "grandmother",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "recommendation",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "supermarket",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "engineering",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "midnight",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    return products;
  }
  
  static  List<Product> getDummyStarterProducts(){
    List<Product> products = []; 
    var random = Random();
    products.add(Product(name: "blue VAPE",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "outlet",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "regret",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    products.add(Product(name: "score",categoryList: ["Hell", "Heaven"],mrp: random.nextInt(50) * random.nextDouble(),shopRef: "/shiooffeefqoi",sku:"/SKU${random.nextInt(15)}" ,availability:random.nextBool() ,brand: "BLUE HEIsT",description: "OPJWOHcnbwvow" ,discount: random.nextDouble(),imageUrl: "https://picsum.photos/536/354",stock: random.nextInt(15)));
    return products;
  }
}
