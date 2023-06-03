import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:project2/models/list_user.dart';
import 'package:project2/models/user_data.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/const_string.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isVisibleConfirm = false;

  var isDataSubmiting = false.obs;
  String ?myToken ;
  int? userId;
  var box = Hive.box('myBox');

  String? selectedValue;
  String username1 = "";
  String email1 = "";
  String password1 = "";
  String confirmPass1 = "";
  String phone1 = "";
  String gender1 = "";
  var language = <String>['m', 'f'];
  void onSelected(String value) {
    selectedValue = value;
    update();
  }

  void switchVisible() {
    isVisible = !isVisible;
    update();
  }

  void switchVisibleConfirm() {
    isVisibleConfirm = !isVisibleConfirm;
    update();
  }

  void signUp(String name, String username, String email, String password,
      String confirmPass, String phone, String gender) {
    if (password != confirmPass) {
      Get.snackbar("faild", "password doesnt match");
    } else if (!isEmailValid(email)) {
      Get.snackbar("faild", "Email error");
    } else {
      username1 = username;
      email1 = email;
      password1 = password;
      confirmPass1 = confirmPass;
      phone1 = phone;
      gender1 = gender;
    }

    postDataSignUp();
  }

  Future<void> postDataSignUp() async {
    Map<String, dynamic> databody = {
      "name":"name",
      "user_name": username1,
      "email": email1,
      "password": password1,
      "c_password": confirmPass1,
      "phone": phone1,
      "gender": gender1
    };
    var dataToSend = json.encode(databody);
    print(dataToSend);
    var response = await http.post(
      Uri.parse("$baseUrl/api/register"),
      body: databody,
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
       print(response.body);
      Get.offNamed(Routes.loginScreen);
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  logIn(email, password) async {
    isDataSubmiting.value = true;
    Map<dynamic, dynamic> databody = {
      "login": email,
      "password": password,
    };
    //var dataToSend = json.encode(databody);
    var response = await http.post(
        Uri.parse("$baseUrl/api/login"),
        body: databody);
    if (response.statusCode == 200) {
      isDataSubmiting.value = false;
      Map<String, dynamic> responseData = jsonDecode(response.body);
      // print(responseData);
      myToken = responseData['user']['token'];
      userId = responseData['user']['userInfo']['id'];
      /*print(responseData['user']['token']);
      print("++++++++++++++++++");
      print(myToken); */
      Get.offNamed(Routes.mainScreen);

      // saveToken(responseData['token']);
    } else {
      isDataSubmiting.value = false;
      Get.snackbar("faild", "api problem", backgroundColor: Colors.red[300]);
    }

    box.put('login', myToken);
    box.put('userId', userId);

    print(box.get('login'));
    print(box.get('userId'));
  }

  void saveToken(dynamic token) async {}

  getToken() async {
    var box = await Hive.box('myBox');
    myToken = await box.get('login');
    return myToken;
  }

  getUserId() async {
    var box = await Hive.box('myBox');
    userId = await box.get('userId');
    return userId;
  }

  void logOut() async {
    var box = Hive.box('myBox');
    box.clear();
    Get.offAllNamed(Routes.loginScreen);
  }

  header() async {
    var box = Hive.box('myBox');
    String token = box.get("login");
    Map<String, String> myHeader = {'authorization': token};
    return myHeader;
  }

//oninit
  /* getProfile() async {
    var response =
        await http.get(Uri.parse('http://localhost:8000/api/getUserInfo'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> responseProfile = jsonDecode(response.body);
      //responseProfile['user-name']
    } else {
      return null;
    }
  }*/
} 
