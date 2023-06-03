import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/logic/controller/laundries_controller.dart';
import 'package:project2/models/complaint.dart';
import 'package:project2/models/laundry.dart';
import 'package:project2/models/order.dart';
import 'package:project2/models/product.dart';
import 'package:project2/utils/const_string.dart';

import 'package:project2/view/screens/laundries/launds.dart';

class RemoteServices {
  var box = Hive.box("mybox");
  String getToken() {
    String t = box.get("login");
    return t;
  }

  static var client = http.Client();
  Future<List<Product>?> fetchProducts1() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }

  Future<List<Product>?> fetchProducts(laundId) async {
    String t = getToken();

    var response = await client
        .post(Uri.parse('$baseUrl/api/getAllProductsForLaundry'), headers: {
      "Authorization": "Bearer $t",
    }, body: {
      "laundry_id": "$laundId"
    });
    if (response.statusCode == 200) {
      print(t);
      print(laundId);
      var jsonString = jsonDecode(response.body);
      print(response.body);
      List<dynamic> products = jsonString["products"]["data"];
      print(products);
      var f = jsonEncode(products);
      return productFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Laundry>?> fetchLaundries() async {
    String t = getToken();
    var response = await client.post(
      Uri.parse('$baseUrl/api/getAllLaundries'),
      headers: {
        "Authorization": "Bearer $t",
      },
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> laundries = jsonString['laundries']['data'];
      var f = jsonEncode(laundries);
      return laundryFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Laundry>?> fetchLaundriesFilter() async {
    String t = getToken();
    var response =
        await client.post(Uri.parse('$baseUrl/api/getAllLaundries'), headers: {
      "Authorization": "Bearer $t",
    }, body: {
      "work_or_not": "1"
    });
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> laundries = jsonString['laundries']['data'];
      var f = jsonEncode(laundries);
      return laundryFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Order>?> fetchOrders() async {
    String t = getToken();

    var response = await client.get(
        Uri.parse('$baseUrl/api/getAllOrderForUser'),
        headers: {"Authorization": "Bearer $t"});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> l = jsonString['orders'];
      var f = jsonEncode(l);

      print(response.body);
      return orderFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Product>?> fetchOrdersInfo(orderId) async {
    String t = getToken();

    var response = await client.get(
        Uri.parse('$baseUrl/api/orderInfo/$orderId'),
        headers: {"Authorization": "Bearer $t"});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      //  print(response.body);
      List<dynamic> orderInfo = jsonString['data']['orderProducts'];
      print(orderInfo);
      var f = jsonEncode(orderInfo);
      return productFromJson2(f);
    } else {
      return null;
    }
  }

  Future<List<Complaint>?> fetchComplaints() async {
    String t = getToken();

    var response = await client.get(
        Uri.parse('$baseUrl/api/getAllComplaintsForUser'),
        headers: {"Authorization": "Bearer $t"});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> l = jsonString['complaints'];
      var f = jsonEncode(l);
      print(f);
      return complaintFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Complaint>?> fetchComplaintsInfo(complaintId) async {
    String t = getToken();
    print(complaintId);
    var response = await client.get(
        Uri.parse('$baseUrl/api/complaintInfo/$complaintId'),
        headers: {"Authorization": "Bearer $t"});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> l = jsonString['complaintInfo'];
      var f = jsonEncode(l);
      print(f);
      return complaintFromJson(f);
    } else {
      return null;
    }
  }

  Future<List<Laundry>?> fetchFavoriteLands(userId) async {
    String t = getToken();

    var response = await client.get(
        Uri.parse('$baseUrl/api/getAllFavoriteLaundryForLaundry'),
        headers: {"Authorization": "Bearer $t"});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      List<dynamic> laundries = jsonString['favorite_laundry'];
      var f = jsonEncode(laundries);
      return laundryFromJson(f);
    } else {
      return null;
    }
  }
}
