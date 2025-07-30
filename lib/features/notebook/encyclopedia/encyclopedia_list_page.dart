import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/encyclopedia/encyclopedia_model.dart';
import 'package:fitjourney/features/notebook/encyclopedia/encyclopedia_data.dart';
import 'encyclopedia_detail_page.dart';

class EncyclopediaListPage extends StatelessWidget {
  const EncyclopediaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thư viện kiến thức Gym')),
      body: ListView.builder(
        itemCount: encyclopediaSamples.length,
        itemBuilder: (context, index) {
          final entry = encyclopediaSamples[index];
          final isAsset = !(entry.imageUrl?.startsWith('http') ?? false);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: isAsset
                    ? Image.asset(
                  entry.imageUrl ?? '',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.menu_book, size: 40),
                )
                    : Image.network(
                  entry.imageUrl ?? '',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.menu_book, size: 40),
                ),
              ),
              title: Text(
                entry.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                entry.category,
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EncyclopediaDetailPage(entry: entry),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
