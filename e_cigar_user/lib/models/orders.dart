// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';
import 'dart:math';


Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {

  Order({
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

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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

   static List<Order> getDummyPendingOrders() {
      List<Order> orders = [];
      orders.add(Order(amount: 500, customerName: "Sabari", customerRef: 'gvyuweg', dateTimeCreated: DateTime.now(), deliveryAdress: '225, NorthStreet', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER01', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: ProductRef.getDummyProductRefs(), status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "marimithu", customerRef: 'fewefewf', dateTimeCreated: DateTime.now(), deliveryAdress: 'c86, SouthStret', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER02', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: ProductRef.getDummyProductRefs(), status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "Kannayiram", customerRef: 'wefgfwf', dateTimeCreated: DateTime.now(), deliveryAdress: 'w234 94, 32 32 fwwefwf', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER03', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: ProductRef.getDummyProductRefs(), status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "Karuvepliam", customerRef: 'fqwfwqfwqf', dateTimeCreated: DateTime.now(), deliveryAdress: '225, Adams Karuppayae set stret', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER04', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: ProductRef.getDummyProductRefs(), status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "sindangili", customerRef: 'fqfqwfqwfqw', dateTimeCreated: DateTime.now(), deliveryAdress: '5924 AD, Tuticorine', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER05', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: ProductRef.getDummyProductRefs(), status: 'PENDING'));
      return orders;
    }

    static List<Order> getDummyPastOrders() {
      List<Order> orders = [];
      orders.add(Order(amount: 500, customerName: "Talamuthu", customerRef: 'gvyuweg', dateTimeCreated: DateTime.now(), deliveryAdress: '225, NorthStreet', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER010', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: [], status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "kariselVani", customerRef: 'fewefewf', dateTimeCreated: DateTime.now(), deliveryAdress: 'c86, SouthStret', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER009', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: [], status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "Kannukiniyaal", customerRef: 'wefgfwf', dateTimeCreated: DateTime.now(), deliveryAdress: 'w234 94, 32 32 fwwefwf', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER08', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: [], status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "Kulayanikanni", customerRef: 'fqwfwqfwqf', dateTimeCreated: DateTime.now(), deliveryAdress: '225, Adams Karuppayae set stret', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER07', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: [], status: 'PENDING'));
      orders.add(Order(amount: 500, customerName: "Kapp undersans", customerRef: 'fqfqwfqwfqw', dateTimeCreated: DateTime.now(), deliveryAdress: '5924 AD, Tuticorine', driverRef: '/Dwh8dhd28fdh8', id: 'ORDER06', paymentMethod: 'ONLINE', pickupAdress: '225, Nort Street', productRefs: [], status: 'PENDING'));
      return orders;
    }


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

    static List<ProductRef>getDummyProductRefs() {
      List<ProductRef> productRefs = [];
      var random = Random();
      productRefs.add(ProductRef(productName: "VApE CIGAR",productPrice: random.nextInt(50) + random.nextDouble() ,productRef: "/iubhwiufweifbgiwegb",quantity: random.nextInt(10) ));
      productRefs.add(ProductRef(productName: "BLUE DEVIL",productPrice: random.nextInt(50) + random.nextDouble() ,productRef: "/iubhwiufweifbgiwegb",quantity: random.nextInt(10) ));
      productRefs.add(ProductRef(productName: "CANE VIpER",productPrice: random.nextInt(50) + random.nextDouble() ,productRef: "/iubhwiufweifbgiwegb",quantity: random.nextInt(10) ));
      productRefs.add(ProductRef(productName: "SMO KEN-CIGAR",productPrice: random.nextInt(50) + random.nextDouble() ,productRef: "/iubhwiufweifbgiwegb",quantity: random.nextInt(10) ));
      return productRefs;
    }
    
}