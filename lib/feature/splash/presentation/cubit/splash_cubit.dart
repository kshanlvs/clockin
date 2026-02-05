import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashNavigateToLogin extends SplashState {}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void start() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashNavigateToLogin());
  }
}
