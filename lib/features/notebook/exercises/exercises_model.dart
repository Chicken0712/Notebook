class Exercise {
  int? id;
  String name;
  String description;
  int duration;
  String category;
  String difficulty;
  String equipment;
  String muscles;
  String caloriesBurned;
  String imageUrl;

  Exercise({
    this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.category,
    required this.difficulty,
    required this.equipment,
    required this.muscles,
    required this.caloriesBurned,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'category': category,
      'difficulty': difficulty,
      'equipment': equipment,
      'muscles': muscles,
      'caloriesBurned': caloriesBurned,
      'imageUrl': imageUrl,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      duration: map['duration'],
      category: map['category'],
      difficulty: map['difficulty'],
      equipment: map['equipment'],
      muscles: map['muscles'],
      caloriesBurned: map['caloriesBurned'],
      imageUrl: map['imageUrl'],
    );
  }
}
