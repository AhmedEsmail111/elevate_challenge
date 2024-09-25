import 'package:dio/dio.dart';
import 'package:elevate_challenge/core/utils/services/api_service.dart';
import 'package:elevate_challenge/features/home/data/repos/home_repo_impl.dart';
import 'package:elevate_challenge/features/home/domain/use_cases/fetch_products_use_case.dart';
import 'package:locator/locator.dart';

import '../../features/home/data/data_sources/remote_data_source.dart';

void registerSingletonsInstances() {
  const Locator locator = Locator();

  locator.put<ApiService>(ApiService(
    dio: Dio(),
  ));

  locator.put<HomeRepoImpl>(
    HomeRepoImpl(
      remoteDataSource: RemoteDataSourceImp(
        apiService: locator.get<ApiService>(),
      ),
    ),
  );
  locator.put<FetchProductsUseCase>(FetchProductsUseCase(
    homeRepo: locator.get<HomeRepoImpl>(),
  ));
}
