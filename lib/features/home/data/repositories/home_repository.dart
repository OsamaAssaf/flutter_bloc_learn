import 'package:flutter_bloc_learn/core/utils/results.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';

abstract class HomeRepository {
  Future<Result<List<UserModel>>> fetchTopUsers();

  Future<Result<List<UserModel>>> fetchAllUsers();
}
