import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/core/utils/results.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/data/repositories/home_repository.dart';

part 'top_users_state.dart';

class TopUsersCubit extends Cubit<TopUsersState> {
  TopUsersCubit({required this.homeRepository}) : super(TopUsersInitial());

  final HomeRepository homeRepository;

  Future<void> fetchTopUsers() async {
    emit(TopUsersLoading());

    final Result<List<UserModel>> result = await homeRepository.fetchTopUsers();

    if (result.isSuccess) {
      emit(TopUsersSuccess(result.data!));
    } else {
      emit(TopUsersFailure(result.error!.message));
    }
  }
}
