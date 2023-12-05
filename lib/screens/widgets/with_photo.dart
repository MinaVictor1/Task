import 'package:flutter/material.dart';
import 'package:task/core/controllers/register_cubit/register_cubit.dart';

class WithPhoto extends StatelessWidget {
  const WithPhoto({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: ClipOval(
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(cubit.image!),
            fit: BoxFit.cover,
          ),
        )),
      ),
    );
  }
}
