import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String nom;
  final String prenom;
  final String code;
  final String email;
  final String nomP;
  final String nomM;
  final String prenomP;
  final String prenomM;
  final String image;
  final String numP;
  final String numM;
  final String sexe;
  final String dateNaiss;
  final int status;
  final int classeId;
  final int organisationId;

  UserEntity({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.code,
    required this.email,
    required this.nomP,
    required this.nomM,
    required this.prenomP,
    required this.prenomM,
    required this.image,
    required this.numP,
    required this.numM,
    required this.sexe,
    required this.dateNaiss,
    required this.status,
    required this.classeId,
    required this.organisationId,
  });

  @override
  List<Object?> get props => [];
}
