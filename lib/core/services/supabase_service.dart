import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rovers_dashboard/core/services/data_service.dart';
import 'package:rovers_dashboard/core/services/failure.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService implements DataService {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<UserModel>>> getData({
    required String endPoint,
    Map<String, dynamic>? filters,
  }) async {
    try {
      var query = _supabase.from(endPoint).select();
      if (filters != null) {
        for (final entry in filters.entries) {
          query = query.eq(entry.key, entry.value);
        }
      }
      final response = await query;
      final users = response.map((x) => UserModel.fromJson(x)).toList();
      return Right(users);
    } on PostgrestException {
      return Left(ServerFailure(message: 'حدث خطأ في الاتصال بالخادم'));
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
    } catch (e) {
      return Left(Failure(message: 'حدث خطأ ما'));
    }
  }
}
