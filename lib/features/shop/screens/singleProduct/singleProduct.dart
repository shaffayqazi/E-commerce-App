//make a single product page

import 'package:flutter/material.dart';
import 'package:tamago_store/common/widgets/texts/product_price_text.dart';
import 'package:tamago_store/common/widgets/texts/product_title_text.dart';
import 'package:tamago_store/features/shop/models/product.dart';
import 'package:tamago_store/utils/constants/colors.dart';
import 'package:tamago_store/utils/constants/sizes.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Image
            Container(
              height: 300,
              width: double.infinity,
              color: MyColors.grey,
            ),
            SizedBox(
              height: MySizes.spaceBtwItems,
            ),

            /// -- Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
              child: MyProductTitleText(
                title: product.title,
              ),
            ),
            SizedBox(
              height: MySizes.spaceBtwItems,
            ),

            /// -- Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
              child: MyProductPriceText(
                price: product.price.toString(),
              ),
            ),
            SizedBox(
              height: MySizes.spaceBtwItems,
            ),

            /// -- Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
              child: Text(
                "This is the Product",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: MyColors.grey,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
