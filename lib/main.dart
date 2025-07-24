import 'package:bookly_app/Features/home/data/repo/home_repo_imp.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/util/app_router.dart';
import 'package:bookly_app/core/util/service_locitaor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/home/presentation/manger/featcherd_books_cubit/featcherd_books_cubit.dart';
import 'Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setUpServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeatcherdBooksCubit(getIt.get<HomeRepoImp>())
              ..fetchFeatcherdBooks()),
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(getIt.get<HomeRepoImp>())..fetchNewsBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backGoundColorApp,
        ),
      ),
    );
  }
}
