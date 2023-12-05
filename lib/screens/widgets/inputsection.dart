import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task/core/themes/color_schemes.g.dart';
import 'package:task/screens/widgets/botton.dart';

import '../../core/controllers/register_cubit/register_cubit.dart';

class InputSectionRegister extends StatefulWidget {
  const InputSectionRegister({super.key, required this.cubit});

  final RegisterCubit cubit;

  @override
  State<InputSectionRegister> createState() => _InputSectionRegisterState();
}

class _InputSectionRegisterState extends State<InputSectionRegister> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController national = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          DefaultFieldForm(
            controller: name,
            keyboard: TextInputType.name,
            valid: (value) {
              if (value == '') {
                return 'Please enter your name';
              }
              return null;
            },
            labelStyle: const TextStyle(color: Colors.black),
            label: 'Full Name',
            prefix: Icons.person,
            hintStyle: const TextStyle(color: Colors.grey),
            show: false,
          ),
          const Gap(15),
          DefaultFieldForm(
            controller: email,
            keyboard: TextInputType.emailAddress,
            valid: (value) {
              if (value == '') {
                return 'Please enter your email';
              }
              return null;
            },
            labelStyle: const TextStyle(color: Colors.black),
            label: 'Email',
            prefix: Icons.email,
            hintStyle: const TextStyle(color: Colors.grey),
            show: false,
          ),
          const Gap(15),
          DefaultFieldForm(
            controller: password,
            keyboard: TextInputType.visiblePassword,
            valid: (value) {
              if (value == '') {
                return 'Please enter your Password';
              }
              return null;
            },
            labelStyle: const TextStyle(color: Colors.black),
            label: 'Password',
            prefix: Icons.password,
            hintStyle: const TextStyle(color: Colors.grey),
            show: false,
          ),
          const Gap(15),
          DefaultFieldForm(
            controller: phone,
            keyboard: TextInputType.phone,
            valid: (value) {
              if (value == '') {
                return 'Please enter your phone';
              }
              return null;
            },
            labelStyle: const TextStyle(color: Colors.black),
            label: 'Phone Number',
            prefix: Icons.phone,
            hintStyle: const TextStyle(color: Colors.grey),
            show: false,
          ),
          const Gap(15),
          DefaultFieldForm(
            controller: national,
            keyboard: TextInputType.number,
            valid: (value) {
              if (value == '') {
                return 'Please enter your national';
              }
              return null;
            },
            labelStyle: const TextStyle(color: Colors.black),
            label: 'national',
            prefix: Icons.video_stable,
            hintStyle: const TextStyle(color: Colors.grey),
            show: false,
          ),
          const Gap(15),
          DefaultButton(
              backgroundColor: Colors.grey,
              borderColor: Colors.red,
              buttonWidget: const Text(
                'Sign in',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              function: () {
                if (formkey.currentState!.validate()) {
                  BlocProvider.of<RegisterCubit>(context).userRegister(
                      name: name.text,
                      email: email.text,
                      phone: phone.text,
                      nationalId: national.text,
                      password: password.text);
                }
              })
        ],
      ),
    );
  }
}
