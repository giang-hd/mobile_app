import 'package:dio/dio.dart';
import 'package:mobile_app/models/account/account.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login/login.dart';
import '../models/login/login_response.dart';

part 'service.g.dart';

@RestApi(baseUrl: "http://localhost:8080/api/v1")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("/signup")
  Future<SignupResponse> signup(@Body() LoginRequest request);

  @POST("/logout")
  Future<void> logout();

  @GET("/account")
  Future<AccountResponse> getAccount();

  @GET("/account/{id}")
  Future<DetailAccountResponse> getAnAccount(@Path('id') String id);

  @PUT("/account/{id}/change-pass")
  Future<void> putChangePass(
    @Path('id') String id,@Body() PassRequest request);
}
