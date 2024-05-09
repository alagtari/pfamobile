import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';

abstract class DriverOnlineDataSource {
  Future<ResponseWrapper<List<DriverModel>>> getDrivers();
  Future<ResponseWrapper<DriverModel>> addDriver(DriverModel driver);
  Future<ResponseWrapper<DriverModel>> updateDriver(
      DriverModel driver, String id);
  Future<Unit> deleteDriver(String id);
}

class DriverOnlineDataSourceImpl implements DriverOnlineDataSource {
  @override
  Future<ResponseWrapper<DriverModel>> addDriver(DriverModel driver) async {
    final res = await sl<Dio>().post(
      "/driver",
      data: driver.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => DriverModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteDriver(String id) async {
    await sl<Dio>().delete(
      "/driver/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<DriverModel>>> getDrivers() async {
    final res = await sl<Dio>().get(
      "/driver",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<DriverModel> driverList = [];
        for (var driver in p0 as List) {
          driverList.add(DriverModel.fromJson(driver));
        }
        return driverList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<DriverModel>> updateDriver(
      DriverModel driver, String id) async {
    final res = await sl<Dio>().patch(
      "/driver/$id",
      data: driver.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => DriverModel.fromJson(p0));
  }
}
