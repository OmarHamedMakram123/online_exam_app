import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/styles/images/app_image_animations.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/splash/view_model/splash_cubit.dart';

import '../../../../core/styles/colors/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _goNextPage() {
    return Navigator.of(context)
        .pushReplacementNamed(splashViewModel.routeName);
  }

  Future<void> _timerPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => splashViewModel.getRouteName(),
    );
  }

  @override
  void initState() {
    _timerPage();
    super.initState();
  }

  var splashViewModel = getIt.get<SplashCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => splashViewModel,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is GoReturnRouteNameState) {
            _goNextPage();
          }
        },
        child:  Scaffold(
          body: Center(
            child: Lottie.asset(AppImageAnimations.splash)
          ),
        ),
      ),
    );
  }
}
