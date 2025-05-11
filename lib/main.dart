import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc_learn/modules/auth/view/auth_view.dart';
import 'package:loading_plus/loading_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (context, child) {
        return LoadingPlus(child: child!);
      },
      home: BlocProvider(create: (_) => AuthBloc(), child: const AuthView()),
    );
  }
}
