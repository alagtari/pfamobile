import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/driver/data/models/driver_model.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';

abstract class TruckOnlineDataSource {
  Future<ResponseWrapper<List<TruckModel>>> getTrucks();
  Future<ResponseWrapper<List<DriverModel>>> getAvailableDrivers();
  Future<ResponseWrapper<TruckModel>> addTruck(TruckModel truck);
  Future<ResponseWrapper<TruckModel>> updateTruck(TruckModel truck, String id);
  Future<Unit> deleteTruck(String id);
}

class TruckOnlineDataSourceImpl implements TruckOnlineDataSource {
  @override
  Future<ResponseWrapper<TruckModel>> addTruck(TruckModel truck) async {
    final res = await sl<Dio>().post(
      "/admin/truck",
      data: truck.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => TruckModel.fromJson(p0));
  }

  @override
  Future<ResponseWrapper<List<DriverModel>>> getAvailableDrivers() async {
    final res = await sl<Dio>().get(
      "/driver",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<DriverModel> driversList = [];
        for (var drivers in p0 as List) {
          driversList.add(DriverModel.fromJson(drivers));
        }
        return driversList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> deleteTruck(String id) async {
    await sl<Dio>().delete(
      "/admin/truck/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<TruckModel>>> getTrucks() async {
    final res = await sl<Dio>().get(
      "/admin/truck",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<TruckModel> truckList = [];
        for (var truck in p0 as List) {
          truckList.add(TruckModel.fromJson(truck));
        }
        return truckList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<TruckModel>>updateTruck(TruckModel truck, String id) async {
    final res = await sl<Dio>().patch(
      "/admin/truck/$id",
      data: truck.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => TruckModel.fromJson(p0));
  }
  
}
