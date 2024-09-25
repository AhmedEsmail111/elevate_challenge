import 'package:dartz/dartz.dart';
import 'package:elevate_challenge/features/home/domain/entities/product_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
}
