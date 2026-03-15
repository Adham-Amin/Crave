class CaloriesStoreRequest {
  final String age;
  final String gender;
  final String tall;
  final String weight;
  final String activity;
  final String goal;

  CaloriesStoreRequest({
    required this.age,
    required this.gender,
    required this.tall,
    required this.weight,
    required this.activity,
    required this.goal,
  });

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'gender': gender,
      'tall': tall,
      'weight': weight,
      'activity': activity,
      'goal': goal,
    };
  }
}
