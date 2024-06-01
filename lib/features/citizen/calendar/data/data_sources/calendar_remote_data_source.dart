import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/calendar/data/models/citizen_plan_model.dart';

abstract class CalendarOnlineDataSource {
  Future<ResponseWrapper<List<CitizenPlanModel>>> getCalendars(String date);
}

class CalendarOnlineDataSourceImpl implements CalendarOnlineDataSource {
  @override
  Future<ResponseWrapper<List<CitizenPlanModel>>> getCalendars(String date) async {
    final res = await sl<Dio>().get(
      "/citizen/plan",
      queryParameters: {"date": date},
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<CitizenPlanModel> calendarList = [];
        for (var calendar in p0 as List) {
          calendarList.add(CitizenPlanModel.fromJson(calendar));
        }
        return calendarList;
      });
    } catch (e) {
      rethrow;
    }
  }
}
