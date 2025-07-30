import 'package:flutter/material.dart';
import 'whey_list_page.dart';

class WheyCategoryPage extends StatelessWidget {
  final categories = [
    {
      'title': 'Whey Concentrate',
      'image': 'assets/whey/concentrate.webp',
      'type': 'concentrate',
    },
    {
      'title': 'Whey Isolate',
      'image': 'assets/whey/isolated.webp',
      'type': 'isolate',
    },
    {
      'title': 'Whey Hydrolyzed',
      'image': 'assets/whey/hydro.webp',
      'type': 'hydrolyzed',
    },
    {
      'title': 'Whey Blend',
      'image': 'assets/whey/blend.webp',
      'type': 'blend',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chọn loại Whey')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WheyListPage(type: item['type']!),
                ),
              );
            },
            child: Container(
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
