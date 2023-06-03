import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/auth/signup.dart';
import 'package:project2/view/widgets/custom_field.dart';
import 'package:project2/view/widgets/custom_text.dart';
import 'package:project2/view/widgets/divider.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [mainColor, secondColor],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 25, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          child: Form(
                            key: _globalKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "login".tr,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: "welcome".tr,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        /*     Container(
                          height: 100,
                          child: Image.asset(
                            "images/washw.png",
                          ),
                        ) */
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomField(
                              controller: emailController,
                              sicon: Text(""),
                              icon: Icons.email,
                              text: "email".tr,
                              obscure: false),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomField(
                              controller: passwordController,
                              sicon: Text(""),
                              icon: Icons.lock,
                              text: "password".tr,
                              obscure: true),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            child: Obx(() => Center(
                                child: controller.isDataSubmiting == false
                                    ? IconButton(
                                        onPressed: () {
                                          print(emailController.text);
                                          final _isValid = _globalKey
                                              .currentState!
                                              .validate();
                                          if (_isValid) {
                                            print(emailController.text);
                                            print(passwordController.text);

                                            controller.logIn(
                                                emailController.text,
                                                passwordController.text);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      )
                                    : CircularProgressIndicator(
                                        color: Colors.white,
                                      ))),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [mainColor, secondColor],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(99),
                                color: mainColor),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: <Widget>[
                              buildDivider(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              buildDivider(),
                            ],
                          ),
                          CustomText(
                            text: "createaccount".tr,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            size: 15,
                            onClick: () {
                              Get.offNamed(Routes.signScreen);
                            },
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
