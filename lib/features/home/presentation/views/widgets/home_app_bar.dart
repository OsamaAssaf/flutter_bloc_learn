import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/core/utils/app_router.dart';
import 'package:flutter_bloc_learn/core/utils/assets_images.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(AssetsImages.logo, height: 32.0, width: 32.0),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
        ),
      ],
    );
  }
}
