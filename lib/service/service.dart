// import 'package:dio/dio.dart';
// import 'package:test_app/model/model_api.dart';
//
// class ApiService {
//   final Dio _dio;
//   final String baseUrl = 'https://hiring-test.stag.tekoapis.net/api/products/management';
//
//   ApiService() : _dio = Dio() {
//     _dio.options.baseUrl = baseUrl;
//     _dio.options.connectTimeout = const Duration(seconds: 5);
//     _dio.options.receiveTimeout = const Duration(seconds: 3);
//     _dio.interceptors.add(LogInterceptor(responseBody: true));
//   }
//
//   Future<ApiResponse> getData() async {
//     try {
//       final response = await _dio.get(baseUrl);
//       return ApiResponse.fromJson(response.data);
//     } catch (e) {
//       throw Exception('Failed to fetch data: $e');
//     }
//   }
// }