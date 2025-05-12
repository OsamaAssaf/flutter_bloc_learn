import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/user_details_view_app_bar.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/user_details_view_body.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserDetailsViewAppBar(title: 'User'),
      body: UserDetailsViewBody(userModel: userModel),
    );
  }
}
