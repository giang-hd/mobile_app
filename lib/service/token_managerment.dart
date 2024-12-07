
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  static Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<void> saveRefreshToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, token);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler
      ) async {
    final token = await TokenManager.getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler
      ) async {
    if (err.response?.statusCode == 401) {
      try {
        final newToken = await _refreshToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        return handler.resolve(await Dio().fetch(err.requestOptions));
      } catch (_) {
        await TokenManager.clearTokens();
        // Get.offAll(() => LoginScreen());
      }
    }

    return handler.next(err);
  }

  Future<String> _refreshToken() async {
    final dio = Dio();
    final refreshToken = await TokenManager.getRefreshToken();

    final response = await dio.post('/refresh-token', data: {
      'refresh_token': refreshToken
    });

    await TokenManager.saveAccessToken(response.data['accessToken']);

    return response.data['accessToken'];
  }
}

class BaseApiService {
  final Dio dio = Dio();

  BaseApiService() {
    dio.interceptors.add(TokenInterceptor());

    dio.options.baseUrl = 'http://localhost:8080/api/v1';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<dynamic> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      String? accessToken = await TokenManager.getAccessToken();

      // Tạo options nếu không có
      options ??= Options();

      // Thêm token vào header
      if (accessToken != null) {
        options.headers?['Authorization'] = 'Bearer $accessToken';
      }
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw 'Lỗi không xác định: ${e.toString()}';
    }
  }

  Future<dynamic> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw 'Lỗi không xác định: ${e.toString()}';
    }
  }

  dynamic _handleError(DioException error) {
    if (error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          return 'Yêu cầu không hợp lệ';
        case 401:
          return error.response?.data['error'];
        case 403:
          return 'Truy cập bị từ chối';
        case 404:
          return 'Không tìm thấy tài nguyên';
        case 500:
          return 'Lỗi máy chủ nội bộ';
        default:
          return error.response?.data["error"] ?? 'Lỗi không xác định';
      }
    }

    print('Dio Error: ${error.message}');
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Kết nối mất quá nhiều thời gian';
      case DioExceptionType.receiveTimeout:
        return 'Nhận dữ liệu quá lâu';
      case DioExceptionType.badCertificate:
        return 'Lỗi chứng chỉ bảo mật';
      case DioExceptionType.badResponse:
        return error.response?.data['message'] ?? 'Lỗi không xác định từ server';
      case DioExceptionType.cancel:
        return 'Yêu cầu đã bị hủy';
      case DioExceptionType.connectionError:
        return 'Không thể kết nối tới máy chủ';
      case DioExceptionType.unknown:
        return 'Lỗi kết nối không xác định';
      default:
        return 'Lỗi không xác định';
    }
  }
}
