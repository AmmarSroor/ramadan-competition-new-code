import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://ramadan-comp-rest.herokuapp.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getToken({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> login({
    required String path,
    required String token,
    required Map<String, dynamic> query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> signUp({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> getTopStudents({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getPointTemplates({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getAdvertisements({
    required String path,
    required String token
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getTotalPointsByDay({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getTotalPointsByType({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getDailyPointsByType({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getAnnouncements({
    required String path,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token ',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getCompetition({
    required String path,
  }) async {
    return await dio.get(
      path,
    );
  }

}

//String getToken="https://ramadan-comp-rest.herokuapp.com/token/";
//String top_3="https://ramadan-comp-rest.herokuapp.com/competition/list_top_students/?fbclid=IwAR1lnjvaOBysS6L-p7qTiPVz12AvIzPlDzAeWIBBqQtwhqTmk1gUDdtlr64";
//String login="https://ramadan-comp-rest.herokuapp.com/student/student-user/(اسم المستخدم)/";
//String signUp="https://ramadan-comp-rest.herokuapp.com/student/student-user/";
//String total_points_by_day="https://ramadan-comp-rest.herokuapp.com/student/point-records/points_stats/?type=total_points_by_day&fbclid=IwAR0kT-mGElnKyIiQTRYe4LfaVxm53d7r2E5zPRY6IyDfYamMxysIGCrrfnk";
//String total_points_by_type="https://ramadan-comp-rest.herokuapp.com/student/point-records/points_stats/?type=total_points_by_type&fbclid=IwAR0kT-mGElnKyIiQTRYe4LfaVxm53d7r2E5zPRY6IyDfYamMxysIGCrrfnk";
//String daily_points_by_type="https://ramadan-comp-rest.herokuapp.com/student/point-records/points_stats/?type=daily_points_by_type&fbclid=IwAR0kT-mGElnKyIiQTRYe4LfaVxm53d7r2E5zPRY6IyDfYamMxysIGCrrfnk";
//String announcements="https://ramadan-comp-rest.herokuapp.com/student/announcements/";
//String point-records="https://ramadan-comp-rest.herokuapp.com/student/point-records/";
// https://ramadan-comp-rest.herokuapp.com/student/point-templates/?fbclid=IwAR2O1LVKbrplCXS4gKIdt9JQ44ZWivLyffOKF6SGc6YNIfeVOnZZY8NPX6o
//String token='';