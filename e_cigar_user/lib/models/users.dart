// To parse this JSON data, do
//
//     final bioData = bioDataFromJson(jsonString);

import 'dart:convert';
import 'package:e_cigar_user/models/shop.dart';

Owner bioDataFromJson(String str) => Owner.fromJson(json.decode(str));

String bioDataToJson(Owner data) => json.encode(data.toJson());

class Driver {
  Driver({
    required this.bioData,
    this.earnings = 0,
    required this.availability,
    required this.currentLocation,
    this.currentOrderRef,
    this.rides,
  });

  BioData bioData;
  double earnings;
  bool availability;
  Location currentLocation;
  String? currentOrderRef;
  dynamic rides;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        bioData: BioData.fromJson(json["bioData"]),
        earnings: json["earnings"].toDouble(),
        availability: json["availability"],
        currentLocation: Location.fromJson(json["currentLocation"]),
        currentOrderRef: json["currentOrderRef"],
        rides: json["rides"],
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "earnings": earnings,
        "availability": availability,
        "currentLocation": currentLocation.toJson(),
        "currentOrderRef": currentOrderRef,
        "rides": rides,
      };
}

class Customer {
  Customer({
    required this.bioData,
    this.myOrdersRefs,
    this.myCart,
    this.favourites,
    this.earnings = 0.0,
  });

  BioData bioData;
  List<String>? myOrdersRefs;
  List<ProductRef>? myCart;
  List<String>? favourites;
  double earnings;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        bioData: BioData.fromJson(json["bioData"]),
        myOrdersRefs: json["myOrdersRefs"] != null ? List<String>.from(json["myOrdersRefs"].map((x) => x)) : [],
        myCart: json["myCart"] != null ? List<ProductRef>.from(json["myCart"].map((x) => x)) : [],
        favourites: json["myOrdersRefs"] != null ? List<String>.from(json["favourites"].map((x) => x)) : [],
        earnings: json["earnings"],
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "myOrdersRefs": myOrdersRefs != null ? List<dynamic>.from(myOrdersRefs!.map((x) => x)) : [],
        "myCart": myCart != null ? List<dynamic>.from(myCart!.map((x) => x)) : [],
        "favourites": favourites != null ? List<dynamic>.from(favourites!.map((x) => x)) : [],
        "earnings": earnings,
      };
}

class Owner {
  Owner({
    required this.bioData,
    required this.restaurantRef,
    required this.earnings,
  });

  BioData bioData;
  String restaurantRef;
  double earnings;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        bioData: BioData.fromJson(json["bioData"]),
        restaurantRef: json["restaurantRef"],
        earnings: json["earnings"] * 1.00,
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "restaurantRef": restaurantRef,
        "earnings": earnings,
      };
}

class BioData {
  BioData({
    required this.name,
    required this.phone,
    this.address,
    required this.uid,
    required this.role,
  });

  String name;
  String phone;
  String? address;
  String uid;
  Role role;

  factory BioData.fromJson(Map<String, dynamic> json) =>
      BioData(name: json["name"], phone: json["phone"], address: json["address"], uid: json["uid"], role: Role.values[json["role"]]);

  Map<String, dynamic> toJson() => {"name": name, "phone": phone, "address": address, "uid": uid, "role": role.index};
}

// ignore: constant_identifier_names
enum Role { ADMIN, DRIVER, OWNER, CUSTOMER }


class ProductRef {
    ProductRef({
        required this.productName,
        required this.quantity,
        required this.productRef,
        required this.productPrice,
    });

    String productName;
    int quantity;
    String productRef;
    double productPrice;

    factory ProductRef.fromJson(Map<String, dynamic> json) => ProductRef(
        productName: json["productName"],
        quantity: int.parse(json["quantity"]),
        productRef: json["productRef"],
        productPrice: json["productPrice"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "quantity": quantity,
        "productRef": productRef,
        "productPrice": productPrice,
    };
}