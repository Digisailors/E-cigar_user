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
    required this.notOnDuty,
    required this.currentLocation,
    this.currentOrderRef,
    this.rides,
  });

  BioData bioData;
  double earnings;
  bool availability;
  bool notOnDuty;
  Location currentLocation;
  String? currentOrderRef;
  dynamic rides;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        bioData: BioData.fromJson(json["bioData"]),
        earnings: json["earnings"].toDouble(),
        availability: json["availability"],
        notOnDuty: json["notOnDuty"],
        currentLocation: Location.fromJson(json["currentLocation"]),
        currentOrderRef: json["currentOrderRef"],
        rides: json["rides"],
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "earnings": earnings,
        "availability": availability,
        "notOnDuty": notOnDuty,
        "currentLocation": currentLocation.toJson(),
        "currentOrderRef": currentOrderRef,
        "rides": rides,
      };
}

class Customer {
  Customer({
    required this.bioData,
    this.myOrdersRefs,
    this.myCartRefs,
    this.favourites,
    this.earnings = 0.0,
  });

  BioData bioData;
  List<String>? myOrdersRefs;
  List<String>? myCartRefs;
  List<String>? favourites;
  double earnings;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        bioData: BioData.fromJson(json["bioData"]),
        myOrdersRefs: List<String>.from(json["myOrdersRefs"].map((x) => x)),
        myCartRefs: List<String>.from(json["myCartRefs"].map((x) => x)),
        favourites: List<String>.from(json["favourites"].map((x) => x)),
        earnings: json["earnings"],
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "myOrdersRefs": myOrdersRefs != null
            ? List<dynamic>.from(myOrdersRefs!.map((x) => x))
            : null,
        "myCartRefs": myCartRefs != null
            ? List<dynamic>.from(myCartRefs!.map((x) => x))
            : null,
        "favourites": favourites != null
            ? List<dynamic>.from(favourites!.map((x) => x))
            : null,
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

  factory BioData.fromJson(Map<String, dynamic> json) => BioData(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        uid: json["uid"], 
        role: Role.values[json["role"]]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "uid": uid,
        "role" : role.index
      };
}

// ignore: constant_identifier_names
enum Role {ADMIN, DRIVER, OWNER, CUSTOMER}