import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/top_users_item_list.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/all_users_item_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          const TopUsersItemList(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Users', style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AllUsersItemList(),
          ),
        ],
      ),
    );
  }
}
