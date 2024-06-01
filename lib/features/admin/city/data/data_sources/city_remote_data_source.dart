import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/city/data/models/add_location_model.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';

abstract class CityOnlineDataSource {
  Future<ResponseWrapper<List<CityModel>>> getCities();
  Future<ResponseWrapper<CityModel>> addCity(CityModel city);
  Future<LatLng?> verifyCity({required String state, required String name});
  Future<ResponseWrapper<CityModel>> updateCity(CityModel city, String id);
  Future<Unit> deleteCity(String id);
  Future<ResponseWrapper<LocationModel>> addCityLocation(
      AddLocationModel location);
  Future<Unit> deleteCityLocation(String id);
}

class CityOnlineDataSourceImpl implements CityOnlineDataSource {
  @override
  Future<ResponseWrapper<CityModel>> addCity(CityModel city) async {
    final res = await sl<Dio>().post(
      "/admin/city",
      data: city.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => CityModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteCity(String id) async {
    await sl<Dio>().delete(
      "/admin/city/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<CityModel>>> getCities() async {
    final res = await sl<Dio>().get(
      "/admin/city",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<CityModel> cityList = [];
        for (var city in p0 as List) {
          cityList.add(CityModel.fromJson(city));
        }
        return cityList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<CityModel>> updateCity(
      CityModel city, String id) async {
    final res = await sl<Dio>().patch(
      "/admin/city/$id",
      data: city.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => CityModel.fromJson(p0));
  }

  @override
  Future<LatLng?> verifyCity(
      {required String state, required String name}) async {
    final Dio dio = Dio();
    final response = await dio.get(
      "https://nominatim.openstreetmap.org/search",
      queryParameters: {
        'q': 'tunisia+$state+$name',
        'format': 'geocodejson',
      },
    );
    log(response.requestOptions.uri.query);
    List featuresList = response.data['features'];
    if (featuresList.isNotEmpty) {
      if (featuresList.length > 1) {
        List<double> coordinates =
            featuresList[1]['geometry']['coordinates'].cast<double>();
        return LatLng(coordinates[1], coordinates[0]);
      }
      List<double> coordinates =
          featuresList[0]['geometry']['coordinates'].cast<double>();
      return LatLng(coordinates[1], coordinates[0]);
    }
    return null;
  }

  @override
  Future<ResponseWrapper<LocationModel>> addCityLocation(
      AddLocationModel location) async {
    final res = await sl<Dio>().post(
      "/admin/location",
      data: location.toJson(),
    );
    return ResponseWrapper.fromJson(
        res.data, (p0) => LocationModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteCityLocation(String id) async {
    await sl<Dio>().delete(
      "/admin/location/$id",
    );
    return unit;
  }
}
