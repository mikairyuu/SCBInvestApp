import 'package:scb_app/domain/entity/response/response_wrap.dart';
import 'package:scb_app/domain/entity/request/auth_request.dart';
import 'package:scb_app/domain/repository/auth_repository.dart';
import 'package:scb_app/services/http/http_client.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required super.ref});

  @override
  Future<ResponseWrap<String>> login(AuthRequest request) async {
    return (await ref.read(httpClientProvider.future)).login(request);
  }

  @override
  Future<ResponseWrap<String>> register(AuthRequest request) async {
    return (await ref.read(httpClientProvider.future)).register(request);
  }
}
