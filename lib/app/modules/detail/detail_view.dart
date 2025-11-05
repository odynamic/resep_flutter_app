import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = Get.arguments as Map<String, dynamic>? ?? {};
    final title = recipe['title'] ?? 'Detail Resep';
    final image = recipe['image'] ?? '';
    final description = recipe['description'] ?? '';
    final ingredients = (recipe['ingredients'] as List<dynamic>?)?.cast<String>() ?? [];
    final tools = (recipe['tools'] as List<dynamic>?)?.cast<String>() ?? [];
    final steps = (recipe['steps'] as List<dynamic>?)?.cast<String>() ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: 200),
              ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text('Alat yang Dibutuhkan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (var t in tools) Text('- $t'),
            const SizedBox(height: 12),
            const Text('Bahan-bahan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (var b in ingredients) Text('- $b'),
            const SizedBox(height: 12),
            const Text('Langkah Memasak', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (int i = 0; i < steps.length; i++) Text('${i + 1}. ${steps[i]}'),
          ],
        ),
      ),
    );
  }
}
