import 'package:flutter/material.dart' hide AppBar;
import 'package:iroid_apk/core/constants/text_styles.dart';
import 'package:iroid_apk/core/utils/responsive.dart';
import 'package:iroid_apk/view/home/widgets/all_time_fav_card.dart';
import 'package:iroid_apk/view/home/widgets/breezy_cotton_banner.dart';
import 'package:iroid_apk/view/home/widgets/friendly_banner.dart';
import 'package:iroid_apk/view/home/widgets/lehenga_banner.dart';
import 'package:iroid_apk/view/home/widgets/tailor_appbar.dart';
import 'package:iroid_apk/view/home/widgets/category_items.dart';
import 'package:iroid_apk/viewmodel/home_vm.dart';
import 'package:provider/provider.dart';
import 'widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Consumer<HomeViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null) {
            return Center(child: Text(vm.error!));
          }

          if (vm.tailorProfile == null) {
            return const SizedBox();
          }

          final profile = vm.tailorProfile!;

          return CustomScrollView(
            slivers: [
              // Tailor header section
              TailorAppBar(
                name: profile.name,
                designation: profile.designation,
                profileImage: profile.image,
                backgroundImage: "assets/images/bg_appbar.png",
              ),

              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: r.height(33)),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                      child: Text(
                        vm.designsTitle,
                        style: AppTextStyles.designTitle.copyWith(
                          fontSize: r.width(32),
                        ),
                      ),
                    ),

                    SizedBox(height: r.height(28)),

                    // Category Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: r.height(25)),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFE3E3E3), Color(0xFFFFFFFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: r.width(16),
                            ),
                            child: Text(
                              vm.categoryTitle,
                              style: AppTextStyles.categoryTitle.copyWith(
                                fontSize: r.width(18),
                              ),
                            ),
                          ),

                          SizedBox(height: r.height(18)),

                          SizedBox(
                            height: r.height(120),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: r.width(16),
                              ),
                              itemCount: vm.categories.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: r.width(18)),
                              itemBuilder: (context, index) {
                                final category = vm.categories[index];

                                return CategoryItem(
                                  name: category.name,
                                  imageUrl: category.image,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: r.height(22))),

              // most popular section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                  child: Text(
                    vm.mostPopularTitle,
                    style: AppTextStyles.mostPopularTitle.copyWith(
                      fontSize: r.width(18),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(22))),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: r.height(300),

                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.mostPopularProducts.length,
                    separatorBuilder: (_, __) => SizedBox(width: r.width(14)),
                    itemBuilder: (context, index) {
                      final product = vm.mostPopularProducts[index];

                      return ProductCard(
                        name: product.name,
                        description: product.description,
                        imageUrl: product.image,
                        price: "${product.currency}${product.price}",
                        originalPrice:
                            "${product.currency}${product.originalPrice}",
                        rating: product.rating,
                        reviews: product.reviewsCount,
                      );
                    },
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 35)),

              // All Time Fav section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                  child: Text(
                    vm.allTimeFavTitle,
                    style: AppTextStyles.mostPopularTitle.copyWith(
                      fontSize: r.width(18),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(16))),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: r.height(260),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: r.height(185),
                          color: const Color(0xFF800080),
                        ),
                      ),

                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.allTimeFavBanners.length,
                        separatorBuilder: (_, __) =>
                            SizedBox(width: r.width(16)),
                        itemBuilder: (context, index) {
                          final banner = vm.allTimeFavBanners[index];

                          return Padding(
                            padding: EdgeInsets.only(bottom: r.height(30)),
                            child: AllTimeFavCard(imageUrl: banner.image),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(9))),

              // Lehenga section
              SliverToBoxAdapter(
                child: vm.lehengaBanner == null
                    ? const SizedBox()
                    : LehengaBanner(imageUrl: vm.lehengaBanner!.image),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(9))),

              // top saled 1
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFF800080)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: r.height(39)),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                        child: Text(
                          vm.topSaledTitle,
                          style: AppTextStyles.mostPopularTitle.copyWith(
                            fontSize: r.width(18),
                          ),
                        ),
                      ),

                      SizedBox(height: r.height(18)),

                      // product list
                      SizedBox(
                        height: r.height(300),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: r.width(16),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.topSaledProducts.length,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: r.width(14)),
                          itemBuilder: (context, index) {
                            final product = vm.topSaledProducts[index];

                            return Padding(
                              padding: EdgeInsets.only(bottom: r.height(20)),
                              child: ProductCard(
                                name: product.name,
                                description: product.description,
                                imageUrl: product.image,
                                price: "${product.currency}${product.price}",
                                originalPrice:
                                    "${product.currency}${product.originalPrice}",
                                rating: product.rating,
                                reviews: product.reviewsCount,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(23))),

              // Breezy cottom
              SliverToBoxAdapter(
                child: vm.breezyCottonBanner == null
                    ? const SizedBox()
                    : BreezyCottonBanner(
                        imageUrl: vm.breezyCottonBanner!.image,
                      ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(43))),

              //top saled 2
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                  child: Text(
                    vm.topSaled2Title,
                    style: AppTextStyles.mostPopularTitle.copyWith(
                      fontSize: r.width(18),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(16))),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: r.height(280),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: r.width(16)),
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.topSaled2Products.length,
                    separatorBuilder: (_, __) => SizedBox(width: r.width(14)),
                    itemBuilder: (context, index) {
                      final product = vm.topSaled2Products[index];

                      return ProductCard(
                        name: product.name,
                        description: product.description,
                        imageUrl: product.image,
                        price: "${product.currency}${product.price}",
                        originalPrice:
                            "${product.currency}${product.originalPrice}",
                        rating: product.rating,
                        reviews: product.reviewsCount,
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: r.height(33))),

              //Floral section
              SliverToBoxAdapter(
                child: vm.friendlyFloralBanner == null
                    ? const SizedBox()
                    : FriendlyFloralBanner(
                        imageUrl: vm.friendlyFloralBanner!.image,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
