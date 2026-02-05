import 'package:clockin/core/constants/app_assets.dart';
import 'package:clockin/core/navigation/route_names.dart';
import 'package:clockin/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateToLogin) {
          context.go(AppRoutes.login);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F2F36),
        body: Center(child: Image.asset(AppAssets.logo, width: 200)),
      ),
    );
  }
}
