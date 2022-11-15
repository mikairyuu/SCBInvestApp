import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/data/repository/auth_repository_impl.dart';
import 'package:scb_app/domain/entity/request/auth_request.dart';
import 'package:scb_app/domain/entity/response/response_wrap.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref: ref));

abstract class AuthRepository {
  final Ref ref;
  AuthRepository({required this.ref});

  Future<ResponseWrap<String>> login(AuthRequest request);

  Future<ResponseWrap<String>> register(AuthRequest request);
}
