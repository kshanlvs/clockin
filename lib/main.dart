import 'package:clockin/core/navigation/app_router.dart';
import 'package:clockin/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // added bloc state management for splash screen
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()..start()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
