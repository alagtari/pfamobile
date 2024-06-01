import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/misson/data/models/misson_model.dart';

abstract class MissionOnlineDataSource {
  Future<ResponseWrapper<List<MissionModel>>> getMissions();
  Future<List<LatLng>> getDirections(LatLng start, LatLng end);
  Future<Unit> startMission(String id);
  Future<Unit> endMission(String id);
  Future<Unit> visitLocation(String locationId, String planId);
}

class MissionOnlineDataSourceImpl implements MissionOnlineDataSource {
  @override
  @override
  Future<ResponseWrapper<List<MissionModel>>> getMissions() async {
    final res = await sl<Dio>().get(
      "/driver/misson",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<MissionModel> missonList = [];
        for (var misson in p0 as List) {
          missonList.add(MissionModel.fromJson(misson));
        }
        return missonList;
      });
    } catch (e) {
      rethrow;
    }
  }

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
      "/driver/misson/$id/start",
    );
    return unit;
  }

  @override
  Future<Unit> endMission(String id) async {
    await sl<Dio>().patch(
      "/driver/misson/$id/end",
    );
    return unit;
  }

  @override
  Future<Unit> visitLocation(String locationId, String planId) async {
    await sl<Dio>().patch(
      "/driver/misson/$planId/visit/$locationId",
    );
    return unit;
  }
}
