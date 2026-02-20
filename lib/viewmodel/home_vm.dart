import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import '../data/models/banner_model.dart';
import '../data/models/breezy_cotton_model.dart';
import '../data/models/friendly_floral_model.dart';
import '../data/models/lehanga_model.dart';
import '../data/models/product_model.dart';
import '../data/models/tailor_profile_model.dart';
import '../data/models/category_model.dart';
import '../data/services/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService apiService;

  HomeViewModel(this.apiService);
  // Models
  TailorProfileModel? tailorProfile;

  List<CategoryModel> categories = [];
  List<ProductModel> mostPopularProducts = [];
  List<BannerModel> allTimeFavBanners = [];
  LehengaModel? lehengaBanner;
  List<ProductModel> topSaledProducts = [];
  BreezyCottonModel? breezyCottonBanner;
  List<ProductModel> topSaled2Products = [];
  FriendlyFloralModel? friendlyFloralBanner;

  // Section Titles

  String designsTitle = '';
  String categoryTitle = '';
  String mostPopularTitle = '';
  String allTimeFavTitle = '';
  String topSaledTitle = '';
  String topSaled2Title = '';

  bool isLoading = false;
  String? error;

  Future<void> fetchHomeData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final data = await apiService.getFashionData().timeout(
        const Duration(seconds: 15),
      );

      final mainData = data['data'];

      // Titles
      designsTitle = mainData['designs_by_arya']['section_title'] ?? '';

      categoryTitle = mainData['designs_by_arya']['subtitle'] ?? '';

      mostPopularTitle = mainData['most_popular']['section_title'] ?? '';

      allTimeFavTitle = mainData['all_time_fav']['section_title'] ?? '';

      topSaledTitle = mainData['top_saled']['section_title'] ?? '';

      topSaled2Title = mainData['top_saled_2']['section_title'] ?? '';

      // Tailor profile
      tailorProfile = TailorProfileModel.fromJson(
        mainData['tailor_near_you']['profile'],
      );

      // Categories
      final categoryJson = mainData['designs_by_arya']['categories'] as List;

      categories = categoryJson.map((e) => CategoryModel.fromJson(e)).toList();

      // Most popular
      final mostPopularJson = mainData['most_popular']['products'] as List;

      mostPopularProducts = mostPopularJson
          .map((e) => ProductModel.fromJson(e))
          .toList();

      // All Time Fav
      final favJson = mainData['all_time_fav']['banners'] as List;

      allTimeFavBanners = favJson.map((e) => BannerModel.fromJson(e)).toList();

      // Lehenga
      lehengaBanner = LehengaModel.fromJson(mainData['lehenga']['banner']);

      // Top Saled
      final topSaledJson = mainData['top_saled']['products'] as List;

      topSaledProducts = topSaledJson
          .map((e) => ProductModel.fromJson(e))
          .toList();

      // Breezy cotton
      breezyCottonBanner = BreezyCottonModel.fromJson(
        mainData['breezy_cotton']['banner'],
      );

      // Top Saled 2
      final topSaled2Json = mainData['top_saled_2']['products'] as List;

      topSaled2Products = topSaled2Json
          .map((e) => ProductModel.fromJson(e))
          .toList();

      // Floral
      friendlyFloralBanner = FriendlyFloralModel.fromJson(
        mainData['friendly_floral']['banner'],
      );
    } on SocketException {
      error = "No internet connection!";
    } on TimeoutException {
      error = "Request timed out!";
    } catch (e) {
      error = "Something went wrong!";
    }

    isLoading = false;
    notifyListeners();
  }
}
