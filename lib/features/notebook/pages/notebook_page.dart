import 'package:fitjourney/features/notebook/pharmacy/pharmacy_category_page.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_list_page.dart';
import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/whey/whey_list_page.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_model.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_list_page.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_subgroup_page.dart';
import 'package:fitjourney/features/notebook/exercises/exercises_group_page.dart';
import 'package:fitjourney/features/notebook/food/food_list_page.dart';
import 'package:fitjourney/features/notebook/food/food_group_page.dart';
import 'package:fitjourney/features/notebook/whey/whey_category_page.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_list_page.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_model.dart';
import 'package:fitjourney/features/notebook/encyclopedia/encyclopedia_model.dart';
import 'package:fitjourney/features/notebook/encyclopedia/encyclopedia_list_page.dart';
class NotebookScreen extends StatelessWidget {
  const NotebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notebookItems = [
      {
        'title': 'Các bài tập',
        'image': 'assets/notebook/workout.jpg',
        'onTap': (BuildContext ctx) {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) => const ExerciseGroupPage()),
          );
        },
      },
      {
        'title': 'Dinh dưỡng thể thao',
        'image': 'assets/notebook/whey.png',
        'onTap': (BuildContext ctx) {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) => WheyCategoryPage()),
          );
        },
      },
      {
        'title': 'Danh sách thức ăn và dinh dưỡng',
        'image': 'assets/notebook/nutrition.png',
        'onTap': (BuildContext ctx) {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) =>  FoodGroupPage()),

          );
        },
      },
      {
        'title': 'Dược lý học (Thuốc)',
        'image': 'assets/notebook/pharmacy.png',
        'onTap': (BuildContext ctx) {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) => PharmacyCategoryPage()),
          );
        },
      },
      {
        'title': 'Bách khoa toàn thư',
        'image': 'assets/notebook/encyclopedia.png',
        'onTap': (BuildContext ctx) {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) => const EncyclopediaListPage()),
          );
        },
      },
    ];

    return Scaffold(
      body: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: notebookItems.map((item) {
            return GestureDetector(
              onTap: () {
                final callback = item['onTap'] as void Function(BuildContext);
                callback(context);
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
                          item['image'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item['title'] as String,
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
          }).toList(),
        ),
      ),
    );
  }
}
