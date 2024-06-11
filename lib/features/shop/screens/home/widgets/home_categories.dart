import 'package:flutter/material.dart';
import 'package:tamago_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:tamago_store/utils/constants/image_strings.dart';

import '../../../models/category_model.dart';

class MyHomeCategories extends StatelessWidget {
  MyHomeCategories({
    super.key,
    required this.categories,
  });
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          print(category.name);
          if (categories.isEmpty) {
            print("No Category Found");
            return const SizedBox(
              child: Text("No Category Found"),
            );
          }
          return MyVerticalImageText(
            image: category.imageUrl ?? MyImages.shoes,
            title: category.name,
            onTap: () {},
          );
        },
      ),
    );
  }
}
