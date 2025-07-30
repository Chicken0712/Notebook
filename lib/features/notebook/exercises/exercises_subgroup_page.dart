import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_list_page.dart'; // để điều hướng sang danh sách bài tập thực tế

class ExerciseSubGroupPage extends StatelessWidget {
  final String groupName;
  final List<Map<String, String>> subgroups;

  const ExerciseSubGroupPage({
    super.key,
    required this.groupName,
    required this.subgroups,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName)),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: subgroups.length,
        itemBuilder: (context, index) {
          final subgroup = subgroups[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciseListPage(
                    muscleGroup: groupName,
                    subgroupName: subgroup['name']!,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    subgroup['image']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.fitness_center, size: 80),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subgroup['name']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
