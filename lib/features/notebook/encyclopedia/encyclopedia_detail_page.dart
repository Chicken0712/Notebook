import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/encyclopedia/encyclopedia_model.dart';

class EncyclopediaDetailPage extends StatelessWidget {
  final Encyclopedia entry;

  const EncyclopediaDetailPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final isAsset = !(entry.imageUrl?.startsWith('http') ?? false);

    return Scaffold(
      appBar: AppBar(title: Text(entry.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entry.imageUrl != null)
                Center(
                  child: isAsset
                      ? Image.asset(
                    entry.imageUrl!,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported, size: 100),
                  )
                      : Image.network(
                    entry.imageUrl!,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported, size: 100),
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                "📚 Chủ đề: ${entry.category}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (entry.tags != null && entry.tags!.isNotEmpty)
                Text(
                  "🏷️ Từ khóa: ${entry.tags}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              const SizedBox(height: 16),
              Text(
                entry.content,
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
