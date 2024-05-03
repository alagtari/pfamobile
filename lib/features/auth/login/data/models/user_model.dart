import 'package:mobile/features/auth/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.nom,
    required super.prenom,
    required super.code,
    required super.email,
    required super.nomP,
    required super.nomM,
    required super.prenomP,
    required super.prenomM,
    required super.image,
    required super.numP,
    required super.numM,
    required super.sexe,
    required super.dateNaiss,
    required super.status,
    required super.classeId,
    required super.organisationId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      code: json['code'],
      email: json['email'],
      nomP: json['nomP'],
      nomM: json['nomM'],
      prenomP: json['prenomP'],
      prenomM: json['prenomM'],
      image: json['image'],
      numP: json['numP'],
      numM: json['numM'],
      sexe: json['sexe'],
      dateNaiss: json['dateNaiss'],
      status: json['status'],
      classeId: json['classe_id'],
      organisationId: json['organisation_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'code': code,
      'email': email,
      'nomP': nomP,
      'nomM': nomM,
      'prenomP': prenomP,
      'prenomM': prenomM,
      'image': image,
      'numP': numP,
      'numM': numM,
      'sexe': sexe,
      'dateNaiss': dateNaiss,
      'status': status,
      'classe_id': classeId,
      'organisation_id': organisationId,
    };
  }
}
