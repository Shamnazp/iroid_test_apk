import 'package:flutter/material.dart';
import 'package:iroid_apk/core/constants/text_styles.dart';
import 'package:iroid_apk/core/utils/responsive.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Column(
      children: [
        SizedBox(
          width: r.width(70),
          height: r.width(70),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,

              // Error Handling
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.image_not_supported,
                    size: r.width(24),
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),

        SizedBox(height: r.height(10)),

        SizedBox(
          width: r.width(75),
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.subCategory.copyWith(fontSize: r.width(11)),
          ),
        ),
      ],
    );
  }
}
