class MealModel {
  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.isFavorite,
  });

  final String id;
  final List<String> categories;
  final String title;
  final int affordability;
  final int complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isFavorite;

  MealModel copyWith({
    String? id,
    List<String>? categories,
    String? title,
    int? affordability,
    int? complexity,
    String? imageUrl,
    int? duration,
    List<String>? ingredients,
    List<String>? steps,
    bool? isGlutenFree,
    bool? isVegan,
    bool? isVegetarian,
    bool? isLactoseFree,
    bool? isFavorite,
  }) {
    return MealModel(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      affordability: affordability ?? this.affordability,
      complexity: complexity ?? this.complexity,
      imageUrl: imageUrl ?? this.imageUrl,
      duration: duration ?? this.duration,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'] as String,
      categories: List<String>.from(json['categories']),
      title: json['title'] as String,
      affordability: json['affordability'] as int,
      complexity: json['complexity'] as int,
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as int,
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      isGlutenFree: json['isGlutenFree'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool,
      isFavorite: json['isFavorite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'affordability': affordability,
      'complexity': complexity,
      'imageUrl': imageUrl,
      'duration': duration,
      'ingredients': ingredients,
      'steps': steps,
      'isGlutenFree': isGlutenFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isLactoseFree': isLactoseFree,
      'isFavorite': isFavorite,
    };
  }

  @override
  String toString() {
    return 'MealModel(id: $id, title: $title, categories: $categories, affordability: $affordability, complexity: $complexity, duration: $duration)';
  }
}