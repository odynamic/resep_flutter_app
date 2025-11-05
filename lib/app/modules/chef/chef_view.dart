import 'package:flutter/material.dart';

class ChefView extends StatelessWidget {
  const ChefView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Chef'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/chef.jpg'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Juna Rorimpandey',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Chef Juna Rorimpandey adalah chef berpengalaman yang fokus pada masakan tradisional Indonesia. '
                    'Dalam aplikasi ini, beliau berbagi resep dan tips memasak makanan tradisional.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.star, color: Colors.pink, size: 30),
                      SizedBox(height: 4),
                      Text('Pengalaman', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: const [
                      Icon(Icons.local_dining, color: Colors.pink, size: 30),
                      SizedBox(height: 4),
                      Text('Spesialis', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: const [
                      Icon(Icons.book, color: Colors.pink, size: 30),
                      SizedBox(height: 4),
                      Text('Resep Favorit', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
