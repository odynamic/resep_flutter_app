import 'package:flutter/material.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'Gunakan bahan segar untuk rasa maksimal.',
      'Siapkan semua bahan sebelum memasak (mise en place).',
      'Periksa rasa secara berkala saat memasak.',
      'Gunakan api sesuai jenis masakan (sayur api besar, slow-cook untuk semur).',
      'Bersihkan pisau dan alat setelah pemakaian.'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tips Memasak')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: tips.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(tips[index]),
          ),
        ),
      ),
    );
  }
}
