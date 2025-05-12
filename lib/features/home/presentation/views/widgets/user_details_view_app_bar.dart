import 'package:flutter/material.dart';

class UserDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UserDetailsViewAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }
}
