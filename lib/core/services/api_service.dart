import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/products';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getProducts() async {
    return await dio.get(_baseUrl).then((response) => response.data);
  }
}
