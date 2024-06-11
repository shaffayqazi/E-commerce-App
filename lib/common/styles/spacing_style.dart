import 'package:flutter/material.dart';
import 'package:tamago_store/utils/constants/sizes.dart';

class MySpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MySizes.appBarHeight,
    left: MySizes.defaultSpace,
    bottom: MySizes.defaultSpace,
    right: MySizes.defaultSpace,
  );
}