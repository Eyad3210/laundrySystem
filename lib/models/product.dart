import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
List<Product> productFromJson2(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? laundryProductId;
  int? price;
  int? vipPrice;
  String? discountName;
  double? rateDiscount;
  String? description;
  DateTime? expirationDate;
  int? serviceTypeId;
  String? serviceTypeName;

  int? id;
  int? categoryId;
  String? name;
  String? photo;

  Product(
      {this.laundryProductId,
      this.price,
      this.vipPrice,
      this.discountName,
      this.rateDiscount,
      this.description,
      this.expirationDate,
      this.serviceTypeId,
      this.id,
      this.categoryId,
      this.name,
      this.photo,
      this.serviceTypeName});

  Product.fromJson(Map<String, dynamic> json) {
    laundryProductId = json['laundry_product_id'];
    price = json['price'];
    vipPrice = json['vip_price'];
    discountName = json['discount_name'];
    rateDiscount = json['rate_discount'];
    description = json['description'];
    expirationDate = json['expiration_date'];
    serviceTypeId = json['service_type_id'];
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    photo = json['photo'];
    serviceTypeName = json['service_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['laundry_product_id'] = this.laundryProductId;
    data['price'] = this.price;
    data['vip_price'] = this.vipPrice;
    data['discount_name'] = this.discountName;
    data['rate_discount'] = this.rateDiscount;
    data['description'] = this.description;
    data['expiration_date'] = this.expirationDate;
    data['service_type_id'] = this.serviceTypeId;
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['service_type_name'] = this.serviceTypeName;
    return data;
  }
}
