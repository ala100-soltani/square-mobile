import 'package:equatable/equatable.dart';

class Entreprise extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String description;
  final String address;

  const Entreprise(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.description,
      required this.address})
      : super();

  @override
  List<Object?> get props => [id, name, email, phone, description, address];
}
