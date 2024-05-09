import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordEntity({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [];
}
