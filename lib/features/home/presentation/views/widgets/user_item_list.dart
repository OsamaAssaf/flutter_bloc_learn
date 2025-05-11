import 'package:flutter/material.dart';

class UserItemList extends StatelessWidget {
  const UserItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, int index) {
        return const UserItemList();
      },
    );
  }
}
