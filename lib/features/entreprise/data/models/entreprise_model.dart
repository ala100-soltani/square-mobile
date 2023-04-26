import 'package:square/features/entreprise/domain/entities/entreprise.dart';

class EntrepriseModel extends Entreprise {
  // Constructor with named parameters
  const EntrepriseModel(
      {String? id,
      required String name,
      required String email,
      required String phone,
      required String description,
      required String address})
      : super(
            id: id,
            name: name,
            email: email,
            phone: phone,
            description: description,
            address: address);

  // Factory method to create a  model instance from a JSON object
  factory EntrepriseModel.fromJson(Map<String, dynamic> json) {
    return EntrepriseModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        description: json['description'],
        address: json['address']);
  }

  // Method to convert a  model instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'description': description,
      'address': address
    };
  }
}
