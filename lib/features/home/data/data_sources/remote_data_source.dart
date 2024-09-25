import 'package:elevate_challenge/core/utils/end_points.dart';

import '../../../../core/utils/services/api_service.dart';

abstract class RemoteDataSource {
  Future<List<dynamic>> fetchProducts();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImp({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<dynamic>> fetchProducts() async {
    return await _apiService.get(endPoint: productsUrl);
  }
}
