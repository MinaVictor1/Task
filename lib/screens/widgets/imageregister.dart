import 'package:task/screens/widgets/with_photo.dart';

import './nophoto.dart';
import 'package:flutter/material.dart';
import 'package:task/core/controllers/register_cubit/register_cubit.dart';

class ImageRegister extends StatelessWidget {
  const ImageRegister({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: cubit.image == null
          ? MaterialButton(
              onPressed: () {
                cubit.addImage();
              },
              child: const NoPhoto(),
            )
          : WithPhoto(cubit: cubit),
    );
  }
}
