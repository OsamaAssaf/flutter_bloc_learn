import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/core/utils/results.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/data/repositories/home_repository.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit({required this.homeRepository}) : super(AllUsersInitial());

  final HomeRepository homeRepository;

  Future<void> fetchAllUsers() async {
    emit(AllUsersLoading());

    final Result<List<UserModel>> result = await homeRepository.fetchAllUsers();

    if (result.isSuccess) {
      emit(AllUsersSuccess(result.data!));
    } else {
      emit(AllUsersFailure(result.error!.message));
    }
  }
}
