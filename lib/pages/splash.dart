import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/user_cubit.dart';
import '../models/user_model.dart';
import 'login.dart';
import 'main.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(
      builder: (context, user) {
        return AnimatedSplashScreen(
          backgroundColor: Colors.orange,
          splash: Icons.airplane_ticket_rounded,
          nextScreen: user == null ? const LoginPage() : const MainPage(),
          splashTransition: SplashTransition.rotationTransition,
          duration: 500,
        );
      },
    );
  }
}
