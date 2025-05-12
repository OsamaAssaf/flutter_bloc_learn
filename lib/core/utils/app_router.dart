import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';
import 'package:flutter_bloc_learn/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_bloc_learn/features/home/presentation/manager/all_users/all_users_cubit.dart';
import 'package:flutter_bloc_learn/features/home/presentation/manager/top_users/top_users_cubit.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc_learn/features/home/presentation/views/user_details_view.dart';
import 'package:flutter_bloc_learn/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc_learn/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

mixin AppRouter {
  static const String kSplashView = '/';
  static const String kHomeView = '/home';
  static const String kUserDetailsView = '/user-details';
  static const String kSearchView = '/search';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kSplashView, builder: (_, __) => const SplashView()),
      GoRoute(
        path: kHomeView,
        builder:
            (_, __) => MultiBlocProvider(
              providers: [
                BlocProvider<TopUsersCubit>(
                  create:
                      (_) =>
                          TopUsersCubit(homeRepository: HomeRepositoryImpl())
                            ..fetchTopUsers(),
                ),
                BlocProvider(
                  create:
                      (_) =>
                          AllUsersCubit(homeRepository: HomeRepositoryImpl())
                            ..fetchAllUsers(),
                ),
              ],
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: kUserDetailsView,
        builder:
            (_, GoRouterState state) =>
                UserDetailsView(userModel: state.extra as UserModel),
      ),
      GoRoute(path: kSearchView, builder: (_, __) => const SearchView()),
    ],
  );
}
