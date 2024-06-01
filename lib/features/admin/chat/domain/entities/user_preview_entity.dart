import 'package:equatable/equatable.dart';

class UserPreviewEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String? image;

  const UserPreviewEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.image,
  });

  @override
  List<Object> get props => [];
}
