import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/city/data/models/city_model.dart';

abstract class CityOnlineDataSource {
  Future<ResponseWrapper<List<CityModel>>> getCities();
  Future<ResponseWrapper<CityModel>> addCity(CityModel city);
  Future<ResponseWrapper<CityModel>> updateCity(CityModel city, String id);
  Future<Unit> deleteCity(String id);
}

class CityOnlineDataSourceImpl implements CityOnlineDataSource {
  @override
  Future<ResponseWrapper<CityModel>> addCity(CityModel city) async {
    final res = await sl<Dio>().post(
      "/city",
      data: city.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => CityModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteCity(String id) async {
    await sl<Dio>().delete(
      "/city/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<CityModel>>> getCities() async {
    final res = await sl<Dio>().get(
      "/city",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<CityModel> cityList = [];
        for (var city in p0 as List) {
          cityList.add(CityModel.fromJson(city));
        }
        return cityList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<CityModel>>updateCity(CityModel city, String id) async {
    final res = await sl<Dio>().patch(
      "/city/$id",
      data: city.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => CityModel.fromJson(p0));
  }
}
