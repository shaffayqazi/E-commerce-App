import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tamago_store/utils/http/http_client.dart';

import '../../../../navigation_menu.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var emailError = ''.obs;
  var passwordError = ''.obs;
  var rememberMe = false.obs;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email address.';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-z_+%=-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty.';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }

  Future<void> login() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == true) {
      try {
        final response = await MyHttpHelper.post("users/login", {
          "email": emailController.text,
          "password": passwordController.text,
        });
        GetStorage().write('token', response['token']);
        GetStorage().write('isLogged', true);
        Get.to(() => NavigationMenu());
        print(GetStorage().read('isLogged'));
      } catch (e) {
        Get.snackbar('Login Failed', "Please check your credentials",
            snackPosition: SnackPosition.BOTTOM);
        print(e.toString());
      }

      // Navigate to the next screen or perform login logic
    }
  }
}
