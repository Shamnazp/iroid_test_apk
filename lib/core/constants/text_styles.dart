import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle name = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xFFF8F8F8),
    height: 1,
  );

  static const TextStyle designation = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xFFCFCFCF),
    height: 1,
  );

  static const TextStyle follow = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1,
  );

  static const TextStyle viewMore = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFF8F8F8),
    height: 1,
  );

  //categories
  static const TextStyle designTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: Color(0xFF0F0F0F),
    height: 1,
  );

  static const TextStyle categoryTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle subCategory = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // most popular
  static const TextStyle mostPopularTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xFF272727),
  );

  static const TextStyle ratingText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1E1E1E),
  );

  static const TextStyle productName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF242424),
  );

  static const TextStyle productDescription = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF5E5E5E),
  );

  static const TextStyle price = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Color(0xFF363842),
  );

  static const TextStyle originalPrice = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Color(0xFF81859C),
    decoration: TextDecoration.lineThrough,
  );

  // banner
  static const TextStyle bannerBrandMain = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.gold,
  );

  static const TextStyle bannerBrandSub = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.gold,
  );

  static const TextStyle bannerTitle = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
