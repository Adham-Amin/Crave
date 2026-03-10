import 'package:crave/features/auth/domain/entities/user_entity.dart';

class AuthResponse {
  String? token;
  String? name;
  String? email;

  AuthResponse({this.token, this.name, this.email});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    token: json['token'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
  };

  UserEntity toEntity() => UserEntity(
    name: name ?? 'Adham Amin',
    email: email ?? 'adhamamin@me.com',
  );
}
