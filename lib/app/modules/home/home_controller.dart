import 'package:get/get.dart';

class HomeController extends GetxController {
  var favorites = <String>[].obs;
  var searchQuery = ''.obs;
  var allRecipes = <Map<String, dynamic>>[].obs;

  void setRecipes(List<Map<String, dynamic>> recipes) {
    allRecipes.assignAll(recipes);
  }

  void toggleFavorite(String title) {
    if (favorites.contains(title)) {
      favorites.remove(title);
    } else {
      favorites.add(title);
    }
  }

  bool isFavorite(String title) => favorites.contains(title);

  List<Map<String, dynamic>> get filteredRecipes {
    if (searchQuery.value.isEmpty) return allRecipes;
    return allRecipes
        .where((r) => r['title'].toString().toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }
}
