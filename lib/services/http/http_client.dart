import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/domain/entity/request/auth_request.dart';
import 'package:scb_app/domain/entity/response/paged_response.dart';
import 'package:scb_app/domain/entity/response/response_wrap.dart';
import 'package:scb_app/services/storage/secure_storage_service.dart';
import 'package:retrofit/http.dart';
part 'http_client.g.dart';

final tokenProvider = FutureProvider(
    (ref) async => await ref.read(secureStorageProvider).getString(keyToken));

final dioProvider = FutureProvider<Dio>((ref) async {
  final dio = Dio();
  final token = await ref.watch(tokenProvider.future);
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  if (isDebug) dio.interceptors.add(LogInterceptor(responseBody: true));
  dio.options.headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  };
  return dio;
});

final httpClientProvider = FutureProvider<HttpClient>((ref) async =>
    HttpClient(await ref.watch(dioProvider.future), baseUrl: baseUrl));

@RestApi()
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @POST("/auth/login")
  Future<ResponseWrap<String>> login(@Body() AuthRequest request);

  @POST("/auth/signup")
  Future<ResponseWrap<String>> register(@Body() AuthRequest request);
}
