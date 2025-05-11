import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: HomeAppBar(), body: HomeViewBody());
  }
}
