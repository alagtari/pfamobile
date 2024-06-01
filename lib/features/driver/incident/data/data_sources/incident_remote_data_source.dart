import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/incident/data/models/incident_model.dart';

abstract class IncidentOnlineDataSource {
  Future<ResponseWrapper<IncidentModel>> addIncident(IncidentModel incident);
}

class IncidentOnlineDataSourceImpl implements IncidentOnlineDataSource {
  @override
  Future<ResponseWrapper<IncidentModel>> addIncident(
      IncidentModel incident) async {
    final res = await sl<Dio>().post(
      "/driver/incident",
      data: await incident.toFormData(),
    );
    return ResponseWrapper.fromJson(
        res.data, (p0) => IncidentModel.fromJson(p0));
  }
}
