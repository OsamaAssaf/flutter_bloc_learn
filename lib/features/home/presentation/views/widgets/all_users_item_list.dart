import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/core/widgets/custom_error_widget.dart';
import 'package:flutter_bloc_learn/core/widgets/custom_loading_widget.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/presentation/manager/all_users/all_users_cubit.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/all_users_item.dart';

class AllUsersItemList extends StatelessWidget {
  const AllUsersItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      builder: (context, state) {
        if (state is AllUsersSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.users.length,
            itemBuilder: (context, int index) {
              final UserModel userModel = state.users.elementAt(index);
              return AllUsersItem(userModel: userModel);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 16.0);
            },
          );
        }

        if (state is AllUsersFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }

        return const CustomLoadingWidget();
      },
    );
  }
}
