
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:e_cigar_user/models/product.dart';
import 'package:e_cigar_user/models/shop.dart';
import 'package:e_cigar_user/models/users.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> users =  firestore.collection('Users');
CollectionReference<Map<String, dynamic>> shops =  firestore.collection('Shops');
CollectionReference<Map<String, dynamic>> items =  firestore.collection('Products');

Stream<DocumentSnapshot<Map<String,dynamic>>> getPersonProfile(String uid) {
  var documentStream = users.doc(uid).snapshots();
  return documentStream;
}
Stream<QuerySnapshot<Map<String,dynamic>>>? getPeople() {
  var collectionStream = users.snapshots();
  return collectionStream;
}

Future<void> addOwner(Owner owner) async {
    owner.bioData.uid = authController.auth.currentUser!.uid;
    users.doc(owner.bioData.uid).set(owner.toJson()).catchError((error)=>print("Failed"));
}

Future<String?> addShop(Shop shop) async{
  String? shopId;
  await shops.add(shop.toJson()).then((docRef)=>shopId = docRef.id);
  return shopId;
}

Future<void> addDriver(Driver driver) async {
   users.add(driver.toJson()).then((value) => print("User added")).catchError((error)=>print("Failed"));
}

Future<void> addCustomer(Customer customer) async {
   users.doc(customer.bioData.uid).set(customer.toJson()).then((value) => print("User added")).catchError((error)=>print("Failed"));
}

Future<void> register(Owner owner, Shop shop) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
    await addShop(shop).then((value){
      owner.restaurantRef = "Shops/" + value.toString();
    });
    await addOwner(owner);
  return batch.commit();
}

updateProductInDatabase(Product product) async {
  await items.doc(product.sku).update(product.toJson()).onError((error, stackTrace) => print("error" + error.toString()));
}

addProduct(Product product) async {
  await items.doc(product.sku).set(product.toJson());
}

 Stream<DocumentSnapshot<Map<String, dynamic>>> getProfile(String uid)  {
  return users.doc(uid).snapshots();
}

 getProfileAsFuture(String uid) async  {
  return await users.doc(uid).get();
}

 Stream<QuerySnapshot<Map<String, dynamic>>> getProducts(int category){
   switch(category){
     case 1 : return items.where('categoryList', arrayContains: 'VAPE').snapshots();
     case 2 : return items.where('categoryList', arrayContains: 'PROVape').snapshots();
     default : return items.where('categoryList', arrayContains: 'VAPE').snapshots();
   }
  
}






