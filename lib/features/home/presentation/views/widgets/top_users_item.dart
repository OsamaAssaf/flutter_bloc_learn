import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';

class TopUsersItem extends StatelessWidget {
  const TopUsersItem({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
