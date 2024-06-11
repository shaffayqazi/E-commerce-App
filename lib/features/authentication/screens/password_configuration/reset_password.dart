import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamago_store/utils/constants/image_strings.dart';
import 'package:tamago_store/utils/constants/sizes.dart';
import 'package:tamago_store/utils/constants/text_string.dart';
import 'package:tamago_store/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          children: [
            /// Image
            Image(
              image: const AssetImage(MyImages.resetPasswordSent),
              width: MyHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),


            /// Title & SubTitle
            Text(MyText.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: MySizes.spaceBtwItems,),
            Text(MyText.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(MyText.tContinue)),
            ),
            const SizedBox(height: MySizes.spaceBtwItems,),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(MyText.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
