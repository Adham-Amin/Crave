class UserEntity {
  final String name;
  final String email;

  UserEntity({required this.email, required this.name});

  Map<String, dynamic> toJson() => {'name': name, 'email': email};

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      UserEntity(email: json['email'], name: json['name']);
}
