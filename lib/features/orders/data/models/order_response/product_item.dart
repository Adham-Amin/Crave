class ProductItem {
  int? id;
  String? name;
  String? description;
  String? image;
  String? category;
  int? price;
  int? totalCalories;
  int? protien;
  int? carb;
  int? fat;
  int? weight;

  ProductItem({
    this.id,
    this.name,
    this.description,
    this.image,
    this.category,
    this.price,
    this.totalCalories,
    this.protien,
    this.carb,
    this.fat,
    this.weight,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    id: json['id'] as int?,
    name: json['Name'] as String?,
    description: json['Description'] as String?,
    image: json['Image'] as String?,
    category: json['category'] as String?,
    price: json['Price'] as int?,
    totalCalories: json['Total Calories'] as int?,
    protien: json['Protien'] as int?,
    carb: json['Carb'] as int?,
    fat: json['Fat'] as int?,
    weight: json['Weight'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'Name': name,
    'Description': description,
    'Image': image,
    'category': category,
    'Price': price,
    'Total Calories': totalCalories,
    'Protien': protien,
    'Carb': carb,
    'Fat': fat,
    'Weight': weight,
  };
}
