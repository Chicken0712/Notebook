import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_model.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (exercise.imageUrl.trim().isEmpty) {
      imageWidget = const Icon(Icons.image_not_supported, size: 100);
    } else if (exercise.imageUrl.startsWith('assets/')) {
      imageWidget = Image.asset(
        exercise.imageUrl,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = Image.network(
        exercise.imageUrl,
        height: 200,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
        const Icon(Icons.image_not_supported, size: 100),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: imageWidget),
              const SizedBox(height: 16),
              const Text(
                "📋 Mô tả",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(exercise.description.isNotEmpty
                  ? exercise.description
                  : "(Không có mô tả)"),
              const SizedBox(height: 16),
              const Text(
                "💪 Thông tin bài tập",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("• Nhóm cơ chính: ${exercise.muscles}"),
              Text("• Nhóm: ${exercise.category}"),
              Text("• Độ khó: ${exercise.difficulty}"),
              Text("• Dụng cụ: ${exercise.equipment}"),
              Text("• Thời lượng gợi ý: ${exercise.duration} phút"),
              Text("• Ước tính calo tiêu hao: ${exercise.caloriesBurned}"),
            ],
          ),
        ),
      ),
    );
  }
}
