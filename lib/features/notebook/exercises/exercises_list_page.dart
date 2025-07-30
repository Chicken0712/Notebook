import 'exercises_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_model.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_data.dart';

enum SortOrder { none, easyToHard, hardToEasy }

class ExerciseListPage extends StatefulWidget {
  final String muscleGroup;
  final String? subgroupName;

  const ExerciseListPage({
    super.key,
    required this.muscleGroup,
    this.subgroupName,
  });

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  SortOrder _sortOrder = SortOrder.none;

  List<Exercise> _getFilteredExercises() {
    final allExercises = [
      ...armExercises,
      ...legExercises,
      ...gluteExercises,
      ...chestExercises,
      ...coreExercises,
    ];

    final filtered = (widget.muscleGroup.toLowerCase() == 'all')
        ? allExercises
        : allExercises.where((e) {
      final muscle = (e.muscles ?? '').toLowerCase().trim();
      final category = (e.category ?? '').toLowerCase().trim();
      final sub = widget.subgroupName?.toLowerCase().trim();
      final group = widget.muscleGroup.toLowerCase().trim();

      if (sub != null && sub.isNotEmpty) {
        return category.contains(sub) || muscle.contains(sub);
      } else {
        return category.contains(group) || muscle.contains(group);
      }
    }).toList();

    filtered.sort((a, b) {
      int getLevel(String d) {
        final dLower = d.toLowerCase();
        if (dLower.contains('khó')) return 3;
        if (dLower.contains('trung')) return 2;
        return 1;
      }

      switch (_sortOrder) {
        case SortOrder.easyToHard:
          return getLevel(a.difficulty).compareTo(getLevel(b.difficulty));
        case SortOrder.hardToEasy:
          return getLevel(b.difficulty).compareTo(getLevel(a.difficulty));
        case SortOrder.none:
        default:
          return 0;
      }
    });

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _getFilteredExercises();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách bài tập'),
        actions: [
          PopupMenuButton<SortOrder>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() {
                _sortOrder = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOrder.none,
                child: Text('Chưa sắp xếp'),
              ),
              const PopupMenuItem(
                value: SortOrder.easyToHard,
                child: Text('Từ dễ đến khó'),
              ),
              const PopupMenuItem(
                value: SortOrder.hardToEasy,
                child: Text('Từ khó đến dễ'),
              ),
            ],
          ),
        ],
      ),
      body: filtered.isEmpty
          ? const Center(
        child: Text(
          "Không tìm thấy bài tập phù hợp.",
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final e = filtered[index];
          Widget imageWidget;

          if (e.imageUrl.startsWith('http')) {
            imageWidget = Image.network(
              e.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.fitness_center, size: 32),
            );
          } else {
            imageWidget = Image.asset(
              e.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.fitness_center, size: 32),
            );
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: imageWidget,
              title: Text(
                e.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: DifficultyIndicator(difficulty: e.difficulty),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailPage(exercise: e),
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

class DifficultyIndicator extends StatelessWidget {
  final String difficulty;

  const DifficultyIndicator({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    int level = 1;
    Color color = Colors.green;
    String label = 'Dễ';

    final lower = difficulty.toLowerCase();

    if (lower.contains('trung')) {
      level = 2;
      color = Colors.orange;
      label = 'Trung bình';
    } else if (lower.contains('khó')) {
      level = 3;
      color = Colors.red;
      label = 'Khó';
    }

    return Row(
      children: [
        Row(
          children: List.generate(3, (index) {
            return Container(
              width: 5,
              height: (index + 1) * 5.0 + 5,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: index < level ? color : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
