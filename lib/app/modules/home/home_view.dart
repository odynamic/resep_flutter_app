import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'bottom_nav_controller.dart';
import '../widgets/recipe_card.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navController = Get.put(BottomNavController());
    final HomeController homeController = Get.put(HomeController());

    final recipes = [
      {
        'title': 'Rendang',
        'image': 'assets/images/rendang.jpg',
        'description': 'Rendang daging khas Padang.',
        'ingredients': ['500 gr daging sapi','400 ml santan','5 bawang merah','3 bawang putih','2 lembar daun jeruk','2 batang serai','Cabe sesuai selera'],
        'tools': ['Wajan','Kompor','Pisau','Spatula'],
        'steps': ['Haluskan bumbu dan tumis hingga harum.','Masukkan daging sapi, aduk hingga berubah warna.','Tuang santan dan masak dengan api kecil sampai meresap.','Masak hingga santan mengental dan daging empuk.'],
      },
      {
        'title': 'Gado-gado',
        'image': 'assets/images/gado_gado.jpg',
        'description': 'Gado-gado segar dengan bumbu kacang.',
        'ingredients': ['Tahu, tempe, kol, tauge, kentang, telur, kacang tanah, gula merah.'],
        'tools': ['Panci','Cobek','Pisau','Sendok'],
        'steps': ['Rebus sayuran dan kentang.','Goreng tahu dan tempe.','Haluskan bumbu kacang dan campurkan.','Siram bumbu pada sayuran dan sajikan.'],
      },
      {
        'title': 'Nasi Uduk',
        'image': 'assets/images/nasi_uduk.jpg',
        'description': 'Nasi uduk wangi dengan santan dan pandan.',
        'ingredients': ['500 gr beras','400 ml santan','Daun pandan','Garam secukupnya'],
        'tools': ['Panci','Kompor','Saringan'],
        'steps': ['Cuci beras sampai bersih.','Masak beras bersama santan dan daun pandan hingga matang.','Aduk dan angkat, siap disajikan.'],
      },
      {
        'title': 'Sate Ayam',
        'image': 'assets/images/sate_ayam.jpg',
        'description': 'Sate ayam dengan bumbu kacang.',
        'ingredients': ['500 gr ayam','Tusuk sate','Bumbu kacang'],
        'tools': ['Panggangan','Cobek'],
        'steps': ['Tusuk daging ayam pada tusuk sate.','Bakar sambil dioles bumbu hingga matang.'],
      },
      {
        'title': 'Soto Betawi',
        'image': 'assets/images/soto_betawi.jpg',
        'description': 'Soto Betawi creamy dan gurih.',
        'ingredients': ['500 gr daging sapi','400 ml santan','Bumbu soto'],
        'tools': ['Panci','Kompor','Pisau'],
        'steps': ['Rebus daging dan bumbu hingga empuk.','Masukkan santan, masak sebentar, sajikan hangat.'],
      },
    ];

    homeController.setRecipes(recipes);

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Dapur Resepku'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.pink),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 120),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.pink),
                title: const Text('Home'),
                onTap: () => Get.back(),
              ),
              ListTile(
                leading: const Icon(Icons.lightbulb, color: Colors.pink),
                title: const Text('Tips Memasak'),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.TIPS);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.pink),
                title: const Text('Tentang Chef'),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.CHEF);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail, color: Colors.pink),
                title: const Text('Kontak Chef'),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.CONTACT);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: navController.selectedIndex.value == 0
                ? homeController.filteredRecipes.length
                : homeController.allRecipes.where((r) => homeController.isFavorite(r['title'])).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final recipe = navController.selectedIndex.value == 0
                  ? homeController.filteredRecipes[index]
                  : homeController.allRecipes.where((r) => homeController.isFavorite(r['title'])).toList()[index];

              return RecipeCard(
                title: recipe['title'],
                image: recipe['image'],
                description: recipe['description'],
                onTap: () => Get.toNamed(Routes.DETAIL, arguments: recipe),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          selectedItemColor: Colors.pink,
          onTap: navController.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
        ),
      );
    });
  }
}
