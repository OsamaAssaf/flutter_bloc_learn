import 'package:flutter_bloc_learn/core/errors/failures.dart';
import 'package:flutter_bloc_learn/core/utils/api_service.dart';
import 'package:flutter_bloc_learn/core/utils/results.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/data/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl._();

  static final HomeRepositoryImpl _instance = HomeRepositoryImpl._();

  factory HomeRepositoryImpl() => _instance;

  @override
  Future<Result<List<UserModel>>> fetchTopUsers() async {
    try {
      final List data = await ApiService().get(endpoint: 'users');

      final List<UserModel> users = [];
      for (final Map<String, dynamic> user in data) {
        users.add(UserModel.fromJson(user));
      }
      return Success(users);
    } on Exception catch (_) {
      return Failure(ServerFailure());
    }
  }

  @override
  Future<Result<List<UserModel>>> fetchAllUsers() async {
    try {
      final List data = await ApiService().get(endpoint: 'users');

      final List<UserModel> users = [];
      for (final Map<String, dynamic> user in data) {
        users.add(UserModel.fromJson(user));
      }
      return Success(users);
    } on Exception catch (_) {
      return Failure(ServerFailure());
    }
  }
}
