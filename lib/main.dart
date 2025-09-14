import 'package:bookly/core/helper/app_theme.dart';
import 'package:bookly/core/helper/bloc_observer.dart';
import 'package:bookly/core/helper/get_it.dart';
import 'package:bookly/core/helper/on_generate_route.dart';
import 'package:bookly/core/helper/app_controler.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';

import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final merged = Listenable.merge([
      AppController.locale,
      AppController.themeMode,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepo>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepo>())..fetchNewestBooks(),
        ),
      ],
      child: AnimatedBuilder(
        animation: merged,
        builder: (context, child) {
          return MaterialApp(
            themeMode: AppController.themeMode.value,
            theme: lighTheme(),
            darkTheme: darkTheme(),

            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
            locale: AppController.locale.value,

            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('ar')],
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
