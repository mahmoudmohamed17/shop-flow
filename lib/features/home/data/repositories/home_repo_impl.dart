import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_flow/core/errors/api_server_failure.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/funcs/setup_products.dart';
import 'package:shop_flow/core/funcs/store_data.dart';
import 'package:shop_flow/features/home/data/datasources/home_local_datasource.dart';
import 'package:shop_flow/features/home/data/datasources/home_remote_data_source.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDatasource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDatasource homeLocalDatasource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getTopSellingProducts() async {
    try {
      List<ProductEntity> products = [];
      products = await homeLocalDatasource.getTopSellingProducts();
      if (products.isEmpty) {
        products = await homeRemoteDataSource.getTopSellingProducts();
        await storeData(products);
      }
      await setupProducts(products);
      return right(products);
    } on DioException catch (e) {
      return left(ApiServerFailure.fromDioException(e));
    } catch (e) {
      return left(ApiServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewInProducts() async {
    try {
      List<ProductEntity> products = [];
      products = await homeLocalDatasource.getNewInProducts();
      if (products.isEmpty) {
        products = await homeRemoteDataSource.getNewInProducts();
        await storeData(products);
      }
      await setupProducts(products);
      return right(products);
    } on DioException catch (e) {
      return left(ApiServerFailure.fromDioException(e));
    } catch (e) {
      return left(ApiServerFailure(message: e.toString()));
    }
  }
}
