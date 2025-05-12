import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/all_users_item.dart';

class SearchResultItemList extends StatelessWidget {
  const SearchResultItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return AllUsersItem(userModel: UserModel());
      },
      separatorBuilder: (_, __) {
        return const Divider(color: Colors.white, height: 8.0);
      },
    );
  }
}
