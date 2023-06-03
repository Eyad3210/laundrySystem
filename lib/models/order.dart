import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';
import 'package:project2/models/laundry.dart';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x))); 

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  int? orderId; //get
  int? laundryId; //post
  int? orderType; //post get
  String? description; //post get
  int? price; //get
  int? status_id; //get
  String? laundryName; //get

  Order(
      {this.orderId,
      this.laundryId,
      this.orderType,
      this.description,
      this.price,
      this.status_id,
      this.laundryName});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['id'];
    laundryId = json['laundry_id'];
    orderType = json['order_type'];
    description = json['description'];
    price = json['price'];
    status_id = json['status_id'];
    laundryName = json['laundry_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.orderId;
    data['laundry_id'] = this.laundryId;
    data['order_type'] = this.orderType;
    data['description'] = this.description;
    data['price'] = this.price;
    data['status_id'] = this.status_id;
    data['laundry_name'] = this.laundryName;
    return data;
  }
}
