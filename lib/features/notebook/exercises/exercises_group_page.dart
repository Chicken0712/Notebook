import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_list_page.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_subgroup_page.dart';

class ExerciseGroupPage extends StatelessWidget {
  const ExerciseGroupPage({super.key});

  final List<Map<String, dynamic>> muscleGroups = const [
    {
      'name': 'Cơ Bụng',
      'image': 'assets/exercises/list/abdominal muscles.png',
    },
    {
      'name': 'Cơ Chân',
      'image': 'assets/exercises/list/Leg Muscles.jpg',
      'subgroups':[
        {
          'name': 'Cơ Đùi Sau',
          'image': 'assets/exercises/list/hamstrings.webp',
        },
        {
          'name': 'Cơ Đùi Trước',
          'image': 'assets/exercises/list/abdominal muscles.png',
        },
        {
          'name': 'Cơ Bắp Chân',
          'image': 'assets/exercises/list/calf muscles.jpg',
        }
      ]
    },

    {
      'name': 'Cơ Lưng',
      'image': 'assets/exercises/list/Back Muscles.jpg',
    },
    {
      'name': 'Cơ Mông',
      'image': 'assets/exercises/list/gluteal muscles.jpg',
    },
    {
      'name': 'Cơ Ngực',
      'image': 'assets/exercises/list/Chest Muscles.jpg',
    },
    {
      'name': 'Cơ Tay',
      'image': 'assets/exercises/list/arm muscles.webp',
      'subgroups': [
        {
          'name': 'Cơ Tay Trước',
          'image': 'assets/exercises/list/Biceps Muscles.jpg'
        },
        {
          'name': 'Cơ Tay Sau',
          'image': 'assets/exercises/list/Triceps.jpg'
        },
        {
          'name': 'Cơ Cẳng Tay',
          'image': 'assets/exercises/list/Forearm Muscles.jpg',
        }
      ]
    },

    {
      'name': 'Cơ Vai',
      'image': 'assets/exercises/list/Shoulder Muscles.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập bộ phận')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: muscleGroups.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = muscleGroups[index];

            return GestureDetector(
              onTap: () {
                final name = item['name'] as String;
                final image = item['image'] as String;
                final subgroups = item['subgroups'] as List<Map<String, String>>?;

                if (subgroups != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExerciseSubGroupPage(
                        groupName: name,
                        subgroups: subgroups,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExerciseListPage(
                        muscleGroup: name,
                      ),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  ClipOval(
                    child: item['image'].toString().startsWith('http')
                        ? Image.network(
                      item['image'],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.fitness_center, size: 50),
                    )
                        : Image.asset(
                      item['image'],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item['name'], textAlign: TextAlign.center),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
