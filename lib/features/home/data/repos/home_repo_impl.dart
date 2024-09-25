import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate_challenge/core/errors/failure.dart';
import 'package:elevate_challenge/features/home/data/data_sources/remote_data_source.dart';
import 'package:elevate_challenge/features/home/data/models/products_model/products_model.dart';
import 'package:elevate_challenge/features/home/domain/entities/product_entity.dart';
import 'package:elevate_challenge/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteDataSource _remoteDataSource;

  HomeRepoImpl({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    final List<ProductEntity> products = [];
    try {
      final productsData = await _remoteDataSource.fetchProducts();
      for (final product in productsData) {
        final model = ProductsModel.fromJson(product);
        products.add(ProductEntity.fromModel(model));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(
          errorMessage: 'Oops, There was a problem. please try again later.'));
    }
  }
}
