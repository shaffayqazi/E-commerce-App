// lib/screens/login_form.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tamago_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:tamago_store/features/authentication/screens/signup/signup.dart';
import 'package:tamago_store/utils/constants/sizes.dart';
import 'package:tamago_store/utils/constants/text_string.dart';

import '../login_Controller.dart';


class LoginForm extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            Obx(() => TextFormField(
                  key: const ValueKey('email'),
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.direct_right),
                    labelText: MyText.email,
                    errorText: controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value,
                  ),
                  validator: (value) {
                    controller.emailError.value =
                        controller.validateEmail(value) ?? '';
                    return controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value;
                  },
                )),

            const SizedBox(height: MySizes.spaceBtwInputFields),

            /// Password
            Obx(() => TextFormField(
                  key: const ValueKey('password'),
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: MyText.password,
                    suffixIcon: const Icon(Iconsax.eye_slash),
                    errorText: controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value,
                  ),
                  obscureText: true,
                  validator: (value) {
                    controller.passwordError.value =
                        controller.validatePassword(value) ?? '';
                    return controller.passwordError.value.isEmpty
                        ? null
                        : controller.passwordError.value;
                  },
                )),

            const SizedBox(height: MySizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Obx(() => Row(
                      children: [
                        Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value = value!;
                          },
                        ),
                        const Text(MyText.rememberMe),
                      ],
                    )),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MyText.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: MySizes.spaceBtwSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                child: const Text(MyText.signIn),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: const Text(MyText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
