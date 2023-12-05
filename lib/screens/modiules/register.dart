import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/controllers/register_cubit/register_cubit.dart';
import 'package:task/core/managers/nav.dart';
import 'package:task/core/managers/values.dart';
import 'package:task/core/network/local/cache_helper.dart';
import 'package:task/screens/modiules/login.dart';
import 'package:task/screens/widgets/imageregister.dart';

import '../widgets/inputsection.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (state.userModel.status == 'SUCCESS') {
            print(state.userModel.status);
            CacheHelper.saveData(
                    key: 'userId', value: state.userModel.user!.nationalId)
                .then((value) => nationalId = state.userModel.user!.nationalId);
            CacheHelper.saveData(
                    key: 'token', value: state.userModel.user!.token)
                .then((value) {
              token = state.userModel.user!.token;
              navigateAndFinishThisScreen(context, const LoginPage());
            });
          } else {
            print(state.userModel.message);
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ImageRegister(cubit: cubit),
              InputSectionRegister(cubit: cubit),
            ]),
          ),
        );
      },
    );
  }
}
