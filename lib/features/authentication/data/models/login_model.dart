// User model class
import 'package:square/features/authentication/domain/entities/login.dart';

class LoginModel extends Login {
  // Constructor with named parameters
  const LoginModel({required String token}) : super(token: token);

  // Factory method to create a user model instance from a JSON object
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
    );
  }

  // Method to convert a user model instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
