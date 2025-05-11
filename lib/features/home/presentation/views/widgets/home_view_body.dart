import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/item_list_widget.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/user_item_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          const ItemListWidget(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Users', style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 16.0),
          const Expanded(child: UserItemList()),
        ],
      ),
    );
  }
}
