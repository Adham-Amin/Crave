class MealEntity {
  final num id;
  final String name;
  final String description;
  final String image;
  final num price;
  final num totalCalories;
  final num protien;
  final num carb;
  final num fat;
  final num weight;

  MealEntity({
    required this.id,
    required this.name,
    required this.weight,
    required this.description,
    required this.image,
    required this.price,
    required this.totalCalories,
    required this.protien,
    required this.carb,
    required this.fat,
  });
}
