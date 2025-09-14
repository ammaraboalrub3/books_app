import 'dart:async';

import 'package:bookly/core/util/app_images.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(Assets.imagesLogo, height: 50));
  }
}
