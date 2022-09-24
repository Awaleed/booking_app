import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';

import '../cubits/user_cubit.dart';
import '../helpers/helper.dart';
import '../models/user_model.dart';
import 'splash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 1000);

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      context
          .read<UserCubit>()
          .login(username: data.name, password: data.password);

      if (context.read<UserCubit>().state == null) {
        return 'Wrong username or password';
      } else {
        return null;
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      context.read<UserCubit>().register(
            username: data.name!,
            password: data.password!,
            type: data.additionalSignupData!['type'] == 'user'
                ? UserType.user
                : UserType.admin,
          );

      if (context.read<UserCubit>().state == null) {
        return 'Username is not available';
      } else {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Booking App',
      onLogin: _authUser,
      onSignup: _signupUser,
      additionalSignupFields: [
        UserFormField(
          keyName: 'type',
          userType: LoginUserType.phone,
          displayName: 'type',
          icon: const Icon(Icons.type_specimen_rounded),
          defaultValue: 'user',
          fieldValidator: (value) {
            if (value == null || (value != 'user' && value != 'admin')) {
              return 'Valid values is user and admin';
            } else {
              return null;
            }
          },
        ),
      ],
      hideForgotPasswordButton: true,
      userType: LoginUserType.name,
      userValidator: (value) {
        if ((value ?? '').isEmpty) {
          return 'Username is too short!';
        } else {
          return null;
        }
      },
      onSubmitAnimationCompleted: () =>
          Helpers.navigateAllTheWay(context, const SplashPage()),
      onRecoverPassword: (p0) => null,
    );
  }
}
