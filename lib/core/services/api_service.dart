import 'package:dio/dio.dart';

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
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: headers ??
                {
                  'Authorization': 'Bearer $token',
                }));
    return response;
  }
}
