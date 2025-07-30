import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/food/food_model.dart';
import 'package:fitjourney/features/notebook/food/food_data.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách món ăn')),
      body: ListView.builder(
        itemCount: foodSamples.length,
        itemBuilder: (context, index) {
          final food = foodSamples[index];

          Widget leading;
          if (food.imageUrl != null) {
            if (food.imageUrl!.startsWith('assets/')) {
              leading = Image.asset(
                food.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              );
            } else {
              leading = Image.network(
                food.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.fastfood),
              );
            }
          } else {
            leading = const Icon(Icons.fastfood);
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: leading,
              title: Text(
                food.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  '${food.calories.toStringAsFixed(0)} kcal • ${food.protein.toStringAsFixed(1)}g protein'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FoodDetailPage(food: food),
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
