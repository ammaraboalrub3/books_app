import 'package:bookly/features/home/presentation/view/widgets/custom_drawer.dart';
import 'package:bookly/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = "home_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
