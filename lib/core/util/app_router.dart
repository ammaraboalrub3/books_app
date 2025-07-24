import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo_imp.dart';
import 'package:bookly_app/Features/home/presentation/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/home_details_view.dart';
import 'package:bookly_app/core/util/service_locitaor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/presentation/view/home_view.dart';
import '../../Features/search/presentation/view/search_view.dart';
import '../../Features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kDetailsHomeView = '/detailshomeview';
  static const kSearchHomeView = '/searchomeview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetailsHomeView,
        builder: (context, state) => BlocProvider(
            create: (context) {
              return SimilerBooksCubit(getIt.get<HomeRepoImp>());
            },
            child: HomeDetailesView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchHomeView,
        builder: (context, state) => const SearchHomeView(),
      ),
    ],
  );
}
