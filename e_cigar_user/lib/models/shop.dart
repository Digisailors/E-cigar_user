// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    required this.name,
    required this.ownerRef,
    required this.address,
    required this.location,
    required this.openingTime,
    required this.closingTime,
    required this.availability,
    this.isPermitted = false,
    this.orderRefs,
    this.reviews,
    email,
    phoneNumber,
  });

  String name;
  String ownerRef;
  String? email;
  String? phoneNumber;
  String address;
  bool isPermitted;
  Location location;
  Time openingTime;
  Time closingTime;
  bool availability;
  List<String>? orderRefs;
  List<Review>? reviews;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        ownerRef: json["ownerRef"],
        address: json["address"],
        location: Location.fromJson(json["location"]),
        openingTime: Time.fromJson(json["time"]),
        closingTime: Time.fromJson(json["time"]),
        availability: json["availability"],
        orderRefs: List<String>.from(json["orders"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        isPermitted: json["isPermitted"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "ownerRef": ownerRef,
        "address": address,
        "location": location.toJson(),
        "openingTime": openingTime.toJson(),
        "closingTime": closingTime.toJson(),
        "availability": availability,
        "orders": orderRefs != null ? List<dynamic>.from(orderRefs!.map((x) => x)) : null,
        "reviews": reviews != null ? List<dynamic>.from(reviews!.map((x) => x.toJson())) : null,
      };

  static Shop getShop() {
    return Shop(
        address: 'kailaasa',
        availability: true,
        closingTime: Time(hours: 12, minutes: 00),
        location: Location(latitude: 72.9811808, longitude: 8.08404),
        name: 'Pugai Vaanam',
        openingTime: Time(hours: 12, minutes: 00),
        ownerRef: 'oori BABA');
  }
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Review {
  Review({
    required this.rating,
    this.comments,
    required this.uid,
  });

  int rating;
  String? comments;
  String uid;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comments: json["comments"],
        uid: json["by"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comments": comments,
        "by": uid,
      };
}

Time timeFromJson(String str) => Time.fromJson(json.decode(str));

String timeToJson(Time data) => json.encode(data.toJson());

class Time {
  Time({this.hours = 0, this.minutes = 0});

  int hours;
  int minutes;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hours: json["hours"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "minutes": minutes,
      };
}
