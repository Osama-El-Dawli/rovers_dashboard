import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rovers_dashboard/core/services/auth_service.dart';
import 'package:rovers_dashboard/core/services/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth implements AuthService {
  final _supabase = Supabase.instance.client.auth;
  @override
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _supabase.signInWithPassword(
        password: password,
        email: email,
      );
      return Right(response);
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on PostgrestException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
    } catch (e) {
      return Left(Failure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _supabase.signUp(email: email, password: password);
      return Right(response);
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on PostgrestException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
    } catch (e) {
      return Left(Failure(message: 'حدث خطأ ما'));
    }
  }
}
