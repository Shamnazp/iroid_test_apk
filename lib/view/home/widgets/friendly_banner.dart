import 'package:flutter/material.dart';
import '../../../core/utils/responsive.dart';

class FriendlyFloralBanner extends StatelessWidget {
  final String imageUrl;

  const FriendlyFloralBanner({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return SizedBox(
      width: double.infinity,
      height: r.height(260),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,

        // loading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            color: Colors.grey.shade100,
          );
        },

        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade200,
            child: Icon(
              Icons.image_not_supported,
              size: r.width(40),
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}