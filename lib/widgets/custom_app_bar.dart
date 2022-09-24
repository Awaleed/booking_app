import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/user_cubit.dart';
import '../helpers/helper.dart';
import '../models/user_model.dart';
import '../pages/splash.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String title,
  }) : super(
          title: Text(title),
          centerTitle: false,
          actions: [
            const LogoutButton(),
          ],
        );
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(
      builder: (context, state) {
        if (state == null) {
          return Container();
        } else {
          return IconButton(
            iconSize: 30,
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              context.read<UserCubit>().logout();
              Helpers.navigateAllTheWay(context, const SplashPage());
            },
          );
        }
      },
    );
  }
}
