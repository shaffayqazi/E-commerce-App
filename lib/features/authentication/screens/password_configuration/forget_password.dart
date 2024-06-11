import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tamago_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:tamago_store/utils/constants/sizes.dart';
import 'package:tamago_store/utils/constants/text_string.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Heading
              Text(MyText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(MyText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: MySizes.spaceBtwSections * 2,),

              /// Text field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: MyText.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: MySizes.spaceBtwSections,),

              /// Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPassword()),
                    child: const Text(MyText.submit)),
              ),


            ],
          ),
        )
    );
  }
}
