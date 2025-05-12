import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/core/widgets/custom_error_widget.dart';
import 'package:flutter_bloc_learn/core/widgets/custom_loading_widget.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/presentation/manager/top_users/top_users_cubit.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/top_users_item.dart';

class TopUsersItemList extends StatelessWidget {
  const TopUsersItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopUsersCubit, TopUsersState>(
      builder: (context, state) {
        if (state is TopUsersSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final UserModel userModel = state.users.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TopUsersItem(userModel: userModel),
                );
              },
            ),
          );
        }

        if (state is TopUsersFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }

        return const CustomLoadingWidget();
      },
    );
  }
}
