// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Cart orderFromJson(String str) => Cart.fromJson(json.decode(str));

String orderToJson(Cart data) => json.encode(data.toJson());

class Cart {

  Cart({
    required this.id,
    required this.status,
    required this.customerRef,
    required this.customerName,
    required this.amount,
    required this.productRefs,
    required this.driverRef,
    required this.deliveryAdress,
    required this.pickupAdress,
    required this.paymentMethod,
    // required this.tax,
    required this.dateTimeCreated,
    this.invoiceList,
  });

  String id;
  String status;
  String customerRef;
  String customerName;
  double amount;
  List<ProductRef> productRefs;
  String? driverRef;
  String deliveryAdress;
  String pickupAdress;
  String paymentMethod;
  // int tax;
  DateTime dateTimeCreated;
  List<dynamic>? invoiceList;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        customerRef: json["customerRef"],
        status: json["status"],
        customerName : json["customerName"],
        amount: json["cost"],
        productRefs:List<ProductRef>.from(json["productRefs"].map((x) => ProductRef.fromJson(x))),
        driverRef: json["driverRef"],
        deliveryAdress: json["deliveryAdress"],
        pickupAdress: json["pickupAdress"],
        paymentMethod: json["paymentMethod"],
        // tax: json["tax"],
        dateTimeCreated: DateTime.parse(json["DateTimeCreated"]),
        invoiceList: List<dynamic>.from(json["invoiceList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status" : status,
        "customerRef": customerRef,
        "customerName": customerName,
        "cost": amount,
        "productRefs": List<dynamic>.from(productRefs.map((x) => x.toJson())),
        "driverRef": driverRef,
        "deliveryAdress": deliveryAdress,
        "pickupAdress": pickupAdress,
        "paymentMethod": paymentMethod,
        // "tax": tax,
        "DateTimeCreated": dateTimeCreated.toIso8601String(),
        "invoiceList": invoiceList != null
            ? List<dynamic>.from(invoiceList!.map((x) => x))
            : null,
      };


  double get getCost  {
    double amount = 0;
    for (var productRef in productRefs) {
      amount += (productRef.productPrice * productRef.quantity);
    }return amount;
  }
}


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