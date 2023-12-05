import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:task/core/network/constant.dart';
import 'package:task/core/network/remote/dio_helper.dart';
import 'package:task/models/usermodel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void userRegister(
      {required name,
      required email,
      required phone,
      required nationalId,
      required password}) {
    emit(RegisterLoading());

    DioHelperStore.postData(url: ApiContstant.registerApi, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "password": password,
      "profileImage": userImage,
    }).then((value) {
      print('-----------------------------');
      print(name);
      print(email);
      print(phone);
      print(nationalId);
      print(password);
      userModel = UserModel.fromJson(value.data);
      print(userModel!.user!.name);
      emit(RegisterSuccess(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterError());
    });
  }

  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;
  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes!);
      print('images = $userImage');
      emit(ChooseImage());
    } else {
      print('no image selected');
    }
  }
}
