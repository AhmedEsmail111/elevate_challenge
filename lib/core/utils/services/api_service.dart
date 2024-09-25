import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future get({
    body,
    required String endPoint,
  }) async {
    final response = await _dio.get(
      endPoint,
      data: body,
    );
    return response.data;
  }
}
