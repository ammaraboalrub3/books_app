import 'package:bookly/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = "splash_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SplashViewBody()));
  }
}
