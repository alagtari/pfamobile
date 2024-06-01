import 'package:mobile/features/driver/misson/domain/entities/misson_entity.dart';

class MissionModel  extends MissionEntity {

  MissionModel ({
    required super.id,
  });



  factory MissionModel.fromJson(Map<String, dynamic> json) {
    return MissionModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
