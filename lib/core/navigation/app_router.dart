import 'package:clockin/feature/auth/presentation/pages/login_page.dart';
import 'package:clockin/feature/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [

    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

  ],
);
