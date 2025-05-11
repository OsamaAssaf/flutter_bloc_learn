import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/blocs/auth_bloc/auth_bloc.dart';
import 'package:loading_plus/loading_plus.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          LoadingPlusController().show();
          return;
          // showDialog(context: context, builder: builder);
        }
        if (state is AuthFailure || state is AuthSuccess) {
          LoadingPlusController().dismiss();
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(
                        context,
                      ).add(LoginEvent(email: 'email', password: 'password'));
                      // context.read<AuthCubit>().login();
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
