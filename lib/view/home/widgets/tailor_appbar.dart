import 'package:flutter/material.dart';
import 'package:iroid_apk/core/utils/responsive.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/circle_icon.dart';

class TailorAppBar extends StatefulWidget {
  final String name;
  final String designation;
  final String profileImage;
  final String backgroundImage;

  const TailorAppBar({
    super.key,
    required this.name,
    required this.designation,
    required this.profileImage,
    required this.backgroundImage,
  });

  @override
  State<TailorAppBar> createState() => _TailorAppBarState();
}

class _TailorAppBarState extends State<TailorAppBar> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return SliverAppBar(
      expandedHeight: r.height(271),
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(r.width(20)),
          bottomRight: Radius.circular(r.width(20)),
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(widget.backgroundImage, fit: BoxFit.cover),
            ),

            // Gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF1E0A2A).withOpacity(0.85),
                      const Color(0xFF1A0C25).withOpacity(0.85),
                      const Color(0xFF000000).withOpacity(0.95),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Back button
            Positioned(
              top: r.height(50),
              left: r.width(16),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: r.width(22),
                ),
              ),
            ),

            Positioned(
              left: r.width(20),
              right: r.width(20),
              bottom: r.height(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Profile Image
                      Container(
                        width: r.width(81),
                        height: r.height(85),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(r.width(76)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(r.width(76)),
                          child: Image.network(
                            widget.profileImage,
                            fit: BoxFit.cover,

                            // Indicator
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Center(
                                child: SizedBox(
                                  width: r.width(20),
                                  height: r.width(20),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade300,
                                child: Icon(
                                  Icons.person,
                                  size: r.width(30),
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(width: r.width(15)),

                      // Follow Button
                      SizedBox(
                        width: r.width(145),
                        height: r.height(39),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(r.width(30)),
                            ),
                          ),
                          child: Text(
                            "Follow",
                            style: AppTextStyles.follow.copyWith(
                              fontSize: r.width(12),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      /// ❤️ Wishlist Toggle
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: Container(
                          height: r.width(42),
                          width: r.width(42),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : AppColors.black,
                            size: r.width(20),
                          ),
                        ),
                      ),

                      SizedBox(width: r.width(10)),

                      CircleIconButton(icon: Icons.share, onTap: () {}),
                    ],
                  ),

                  SizedBox(height: r.height(16)),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: AppTextStyles.name.copyWith(
                                fontSize: r.width(18),
                              ),
                            ),
                            SizedBox(height: r.height(6)),
                            Text(
                              widget.designation,
                              style: AppTextStyles.designation.copyWith(
                                fontSize: r.width(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View More",
                          style: AppTextStyles.viewMore.copyWith(
                            fontSize: r.width(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
