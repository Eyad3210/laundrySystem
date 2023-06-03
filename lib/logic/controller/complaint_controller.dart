import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/models/complaint.dart';
import 'package:project2/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:project2/utils/const_string.dart';

class ComplaintController extends GetxController {
  Complaint complaint = Complaint();
  var isLoading = true.obs;
  var complaintListGet = <Complaint>[].obs;
  var complaintInfoListGet = <Complaint>[].obs;
  var box = Hive.box("mybox");
  String getToken() {
    String t = box.get("login");
    return t;
  }

  RemoteServices remote = RemoteServices();

  void sendComplaint(comTypeId, orderId, message) async {
    
    String t = getToken();
    print(t);
var response=await Dio().post("$baseUrl/api/addComplaint",

options: Options(headers:{"Authorization":"Bearer $t"} ),data:{
          "complaint_type_id": comTypeId,
          "order_id": orderId,
          "message": message
        } );
        

        print(response.data);


    /* var response = await http.post(Uri.parse("$baseUrl/api/addComplaint"),
        headers: {
          "Authorization": "Barer $t"
        },
        body: {
          "complaint_type_id": 1,
          "order_id": orderId,
          "message": message
        });

    // body: json.encode(complaint.toJson()));
    print(response.body); */
  }

  void fetchComplaints() async {
    try {
      isLoading(true);
      var comp = await remote.fetchComplaints();
      if (comp != null) {
        complaintListGet.value = comp;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchComplaintsInfo(complaintId) async {
    try {
      isLoading(true);
      var compI = await remote.fetchComplaintsInfo(complaintId);
      if (compI != null) {
        complaintInfoListGet.value = compI;
      }
    } finally {
      isLoading(false);
    }
  }
}
