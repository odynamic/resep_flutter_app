import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../../routes/app_routes.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback? onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find<HomeController>();
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.toNamed(Routes.DETAIL, arguments: {
              'title': title,
              'image': image,
              'description': description,
            });
          },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(image, fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    final fav = c.isFavorite(title);
                    return IconButton(
                      onPressed: () => c.toggleFavorite(title),
                      icon: Icon(fav ? Icons.favorite : Icons.favorite_border),
                      color: Colors.pink,
                    );
                  }),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.DETAIL, arguments: {
                        'title': title,
                        'image': image,
                        'description': description,
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
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
