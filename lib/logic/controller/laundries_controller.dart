import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/models/laundry.dart';
import 'package:project2/models/product.dart';
import 'package:project2/services/location_service.dart';
import 'package:project2/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:project2/utils/const_string.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:vector_math/vector_math.dart';

class LaundriesController extends GetxController {
  int? laundryId;
  var isLoading = true.obs;
  var laundriesListGet = <Laundry>[].obs;
  var laundriesListNearBy = <Laundry>[].obs;
  var laundriesListFavorite = <Laundry>[].obs;

  var remote = RemoteServices();
  var box = Hive.box("mybox");

  getUserId() async {
    int userId = await box.get('userId');
    print("ssssssssssssssssssssssssss");

    print(userId);
    print("ssssssssssssssssssssssssssssssssss");

    return userId;
  }

  String getToken() {
    String t = box.get("login");
    return t;
  }

  @override
  void onInit() {
    fetchLaundries();
    fetchFavoriteLands(getUserId());
    getLocation();
    if (laundriesListGet.isNotEmpty) {
      getNearBy();
    }
    super.onInit();
  }

  void fetchLaundries() async {
    try {
      isLoading(true);
      var launds = await remote.fetchLaundries();
      if (launds != null) {
        laundriesListGet.value = launds;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchLaundriesFilter() async {
    try {
      isLoading(true);
      var launds = await remote.fetchLaundriesFilter();
      if (launds != null) {
        laundriesListGet.value = launds;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchFavoriteLands(userId) async {
    try {
      isLoading(true);
      var launds = await remote.fetchFavoriteLands(userId);
      if (launds != null) {
        laundriesListFavorite.value = launds;
      }
    } finally {
      isLoading(false);
    }
  }

  void addFavorite(landId) async {
    String t = getToken();
    print(landId);
    var response = await http.get(
        Uri.parse("$baseUrl/api/addToFavorite/$landId"),
        headers: {"Authorization": "Bearer $t"});

    print(response.body);
  }

  void deleteFavorite(landId) async {
    String t = getToken();
    var response = await Dio().get("$baseUrl/api/deleteToFavorite/$landId",
        options: Options(headers: {"Authorization": "Bearer $t"}));
    print(response.data);
  }

  void changeIcon(bool statIcon) {
    if (statIcon == false) {
      statIcon = true;
    } else {
      statIcon = false;
    }
    update();
  }

  double long = 0;
  double earthRadius = 6371000;
  double lat = 0;
  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();
    if (locationData != null) {
      lat = locationData.latitude!;
      long = locationData.longitude!;
      update();
    }
    print(lat);
    print(long);
  }

  getDistance(double pLat, double pLng) {
    var dLat = radians(pLat - lat);
    var dLng = radians(pLng - long);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(radians(lat)) * cos(radians(pLat)) * sin(dLng / 2) * sin(dLng / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = earthRadius * c;

    return d;
  }

  void getNearBy() {
    for (var i = 0; i < laundriesListGet.length; i++) {
      print(laundriesListGet);
      print("hiiiaiaiaiaiai");

      var d = getDistance(
          laundriesListGet[i].latitude!, laundriesListGet[i].longitude!);
      print(d);
      if (d < 5000) {
        laundriesListNearBy.add(laundriesListGet[i]);
      }
    }
  }
}
