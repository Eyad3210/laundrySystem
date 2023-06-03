import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/auth_controller.dart';
import 'package:project2/routes/routes.dart';
import 'package:project2/utils/const_string.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/auth/login.dart';
import 'package:project2/view/widgets/custom_field.dart';
import 'package:project2/view/widgets/custom_text.dart';
import 'package:project2/view/widgets/divider.dart';

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
  }) : super(key: key);
  final _globalKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

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
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 1,right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        CustomText(
                          text: "singup".tr,

                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          size: 40,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Form(
                    key: _globalKey,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomField(
                              controller: nameController,
                              sicon: Text(""),
                              icon: Icons.person,
                              text: "username".tr,
                              obscure: false,
                              validator: (value) {
                                if (value.toString().length <= 2 ||
                                    !RegExp(validationName).hasMatch(value)) {
                                  return 'Enter valid name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomField(
                              controller: emailController,
                              sicon: Text(""),
                              icon: Icons.email,
                              text: "email".tr,
                              obscure: false,
                             /*  validator: (value) {
                                if (!RegExp(validationEmail).hasMatch(value)) {
                                  return 'Invalid email';
                                } else {
                                  return null;
                                }
                              }, */
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return CustomField(
                                controller: passwordController,
                                sicon: IconButton(
                                  icon: controller.isVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    controller.switchVisible();
                                  },
                                ),
                                icon: Icons.lock,
                                text: "password".tr,
                                obscure: controller.isVisible ? false : true,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password should be longer or equal to 6 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            }),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomField(
                              controller: confirmPassController,
                              icon: Icons.lock,
                              text: "cpassword".tr,
                              obscure: true,
                              sicon: IconButton(
                                icon: controller.isVisibleConfirm
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  controller.switchVisibleConfirm();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomField(
                              controller: phoneController,
                              icon: Icons.phone,
                              text: "phone".tr,
                              obscure: false,
                              sicon: Text(""),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GetBuilder<AuthController>(builder: (controller) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(width: 1, color: Colors.grey[400]!,)
                                ),
                                child: DropdownButton<String>(
                                    underline: Container(),
                                    hint: Center(child: Text("gender".tr)),
                                    ////controller.selectedValue,
                                    value: controller.selectedValue,
                                    onChanged: (newValue) {
                                      controller.onSelected(newValue!);
                                    },
                                    elevation: 15,
                                    items:  [
                                      DropdownMenuItem(
                                        child: Center(child: Text("male".tr)),
                                        value: 'm',
                                      ),
                                      DropdownMenuItem(
                                        child: Center(child: Text("female".tr)),
                                        value: 'f',
                                      ),
                                    ]),
                              );
                            }),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              
                                InkWell(
                                  onTap: () {
                                    final _isValid =
                                        _globalKey.currentState!.validate();
                                    if (_isValid) {
                                      controller.signUp(
                                          "eyad",
                                          nameController.text,
                                          emailController.text,
                                          passwordController.text,
                                          confirmPassController.text,
                                          phoneController.text,
                                          controller.selectedValue.toString());

                                      print(nameController.text);
                                     // print("objecttttttttttt");
                                    } else
                                      print("object");
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [mainColor, secondColor],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius: BorderRadius.circular(99),
                                        color: mainColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                                Row(
                              children: <Widget>[
                                buildDivider(),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                              text: "login".tr,
                              fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                              size: 15,
                              onClick: () {
                                Get.offNamed(Routes.loginScreen);
                              },
                            ) 
                          ],
                        ),
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
