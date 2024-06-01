
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/injection/injection_container.dart';

abstract class MissionOnlineDataSource {
  Future<List<LatLng>> getDirections(LatLng start, LatLng end);
  Future<Unit> startMission(String id);
  Future<Unit> endMission(String id);
  Future<Unit> visitLocation(String locationId, String planId);
}

class MissionOnlineDataSourceImpl implements MissionOnlineDataSource {
  @override
  @override

  @override
  Future<List<LatLng>> getDirections(LatLng start, LatLng end) async {
    final res =
        await sl<Dio>().get(dotenv.env["ROUTE_API_URL"]!, queryParameters: {
      "api_key": dotenv.env["ROUTE_API_KEY"],
      "start": "${start.longitude},${start.latitude}",
      "end": "${end.longitude},${end.latitude}",
    });
    try {
      final coordinates = res.data["features"][0]["geometry"]["coordinates"];
      List<LatLng> positions = [];
      for (var position in coordinates as List) {
        positions.add(LatLng(position[1], position[0]));
      }
      return positions;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> startMission(String id) async {
    await sl<Dio>().patch(
      "/driver/plan/$id/start",
    );
    return unit;
  }

  @override
  Future<Unit> endMission(String id) async {
    await sl<Dio>().patch(
      "/driver/plan/$id/end",
    );
    return unit;
  }

  @override
  Future<Unit> visitLocation(String locationId, String planId) async {
    await sl<Dio>().patch(
      "/driver/plan/$planId/visit/$locationId",
    );
    return unit;
  }
}
