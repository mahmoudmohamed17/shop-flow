import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getTopSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> getNewInProducts();
}
