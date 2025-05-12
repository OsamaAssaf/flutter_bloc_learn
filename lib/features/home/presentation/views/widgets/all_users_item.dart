import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/core/utils/app_router.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:go_router/go_router.dart';

class AllUsersItem extends StatelessWidget {
  const AllUsersItem({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        GoRouter.of(context).push(AppRouter.kUserDetailsView, extra: userModel);
      },
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.25,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('${userModel.image}'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${userModel.name}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Email: ${userModel.email}'),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Website: ${userModel.website}'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.open_in_browser),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
