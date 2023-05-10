import 'package:cloud_firestore/cloud_firestore.dart';

class UbdateDataModel {
  final List? images;
  final String? id;
  final String name;
  final String condition;
  final String price;
  final String amount;

  UbdateDataModel({
    this.images,
    this.id,
    required this.name,
    required this.condition,
    required this.price,
    required this.amount,
  });
  toJson() {
    return {
      'Images':images,
      'Name': name,
      'Сondition': condition,
      'Price': price,
      'Amount': amount,
    };
  }

  factory UbdateDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UbdateDataModel(
        id: document.id,
        name: data!["Name"],
        condition: data["Condition"],
        price:  data["Price"],
        amount: data["Amount"]);
  }
}
