import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/errors/custom_exception.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/products';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getProducts() async {
    return await dio.get(_baseUrl).then((response) => response.data);
  }

  Future<Response> post({
    required body,
    required String url,
    required String token,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    try {
      var response = await dio.post(url,
          data: body,
          options: Options(
              contentType: contentType,
              headers: headers ??
                  {
                    'Authorization': 'Bearer $token',
                  }));
      return response;
    } on DioException catch (e) {
      debugPrint('Error from ApiService: ${e.response!.data['error']['message']}');
      throw CustomException(message: e.response!.data['error']['message'] ?? 'Unknown error');
    }
    catch (e) {
      debugPrint('Error: ${e.toString()}');
      throw CustomException(message: e.toString());

    }
  }
}
