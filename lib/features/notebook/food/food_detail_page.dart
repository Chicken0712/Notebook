import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/food/food_model.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (food.imageUrl != null) {
      if (food.imageUrl!.startsWith('assets/')) {
        imageWidget = Image.asset(
          food.imageUrl!,
          height: 200,
          fit: BoxFit.contain,
        );
      } else {
        imageWidget = Image.network(
          food.imageUrl!,
          height: 200,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(Icons.fastfood, size: 100),
        );
      }
    } else {
      imageWidget = const Icon(Icons.fastfood, size: 100);
    }

    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: imageWidget),
              const SizedBox(height: 16),
              const Text("🍽️ Thông tin dinh dưỡng",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("• Calo: ${food.calories} kcal"),
              Text("• Protein: ${food.protein}g"),
              Text("• Chất béo: ${food.fat}g"),
              Text("• Carbs: ${food.carbs}g"),
              Text("• Phân loại: ${food.category}"),
              if (food.unit != null) Text("• Đơn vị: ${food.unit}"),
              if (food.brand != null) Text("• Thương hiệu: ${food.brand}"),
              if (food.origin != null) Text("• Xuất xứ: ${food.origin}"),
              const SizedBox(height: 12),
              const Text("📋 Mô tả:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(food.description?.trim().isNotEmpty == true
                  ? food.description!
                  : "(Không có mô tả)"),
            ],
          ),
        ),
      ),
    );
  }
}
