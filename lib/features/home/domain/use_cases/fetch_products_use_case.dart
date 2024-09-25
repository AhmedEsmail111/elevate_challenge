import 'package:dartz/dartz.dart';
import 'package:elevate_challenge/core/errors/failure.dart';
import 'package:elevate_challenge/core/use_case/use_case.dart';
import 'package:elevate_challenge/features/home/domain/repos/home_repo.dart';

import '../entities/product_entity.dart';

class FetchProductsUseCase extends UseCaseNoParam<List<ProductEntity>> {
  final HomeRepo _homeRepo;

  FetchProductsUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<Failure, List<ProductEntity>>> execute() async {
    return await _homeRepo.fetchProducts();
  }
}
