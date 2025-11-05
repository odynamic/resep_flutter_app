import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  void _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'chefjuna@example.com');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+6281234567890');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void _launchInstagram() async {
    final Uri instaUri = Uri.parse('https://instagram.com/chefjuna');
    if (await canLaunchUrl(instaUri)) {
      await launchUrl(instaUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $instaUri';
    }
  }

  Widget contactCard(IconData icon, String label, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink.shade100,
          child: Icon(icon, color: Colors.pink),
        ),
        title: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Chef'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            contactCard(Icons.email, 'chefjuna@example.com', _launchEmail),
            const SizedBox(height: 12),
            contactCard(Icons.phone, '+62 812 3456 7890', _launchPhone),
            const SizedBox(height: 12),
            contactCard(Icons.camera_alt, '@chefjuna', _launchInstagram),
          ],
        ),
      ),
    );
  }
}
