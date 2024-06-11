import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamago_store/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:tamago_store/common/widgets/custom_shape/container/search_contaioner.dart';
import 'package:tamago_store/common/widgets/layouts/grid_layout.dart';
import 'package:tamago_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:tamago_store/common/widgets/texts/section_heading.dart';
import 'package:tamago_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tamago_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tamago_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:tamago_store/utils/constants/image_strings.dart';
import 'package:tamago_store/utils/constants/sizes.dart';
import 'controllers/home_Controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                /// Header
                MyPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      /// -- AppBar
                      MyHomeAppBar(),
                      SizedBox(
                        height: MySizes.spaceBtwSections,
                      ),

                      /// -- Search bar
                      MySearchContainer(
                        text: 'Search in Store',
                      ),
                      SizedBox(
                        height: MySizes.spaceBtwSections,
                      ),

                      /// -- Categories
                      Padding(
                        padding: EdgeInsets.only(left: MySizes.defaultSpace),
                        child: Column(
                          children: [
                            /// --Heading
                            MySectionHeading(
                              title: 'Popular Categories',
                              showActionButton: false,
                            ),
                            SizedBox(
                              height: MySizes.spaceBtwItems,
                            ),

                            /// -- Categories
                            MyHomeCategories(categories: controller.categories),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: MySizes.spaceBtwSections,
                      ),
                    ],
                  ),
                ),

                /// -- Body [Section #3]
                Padding(
                    padding: const EdgeInsets.all(MySizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Promo Slider
                        const MyProSlider(
                          banners: [
                            MyImages.promoBanner1,
                            MyImages.promoBanner2,
                            MyImages.promoBanner3
                          ],
                        ),
                        const SizedBox(
                          height: MySizes.spaceBtwSections,
                        ),

                        /// --Heading
                        MySectionHeading(
                          title: 'Popular Products',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: MySizes.spaceBtwItems,
                        ),

                        /// -- Popular Product
                        MyGridLayout(
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              print(controller.products.length);
                              return MyProductVertical(
                                  product: controller.products[index]);
                            }),
                      ],
                    )),
              ],
            ),
          );
        }
      }),
    );
  }
}
