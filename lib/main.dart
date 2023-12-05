import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/controllers/observer.dart';
import 'package:task/core/controllers/register_cubit/register_cubit.dart';
import 'package:task/core/managers/values.dart';
import 'package:task/core/network/local/cache_helper.dart';
import 'package:task/core/network/remote/dio_helper.dart';
import 'package:task/core/themes/themes.dart';
import 'package:task/screens/modiules/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized.
  await CacheHelper.init(); // Initialize CacheHelper
  DioHelperStore.init(); //Initialize DioHelperStore
  token = CacheHelper.getData(key: 'token');
  nationalId = CacheHelper.getData(key: 'userId');
  print(token);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Brightness.dark)); // Set system UI overlay style.
  Bloc.observer =
      MyBlocObserver(); // Set Bloc observer for monitoring Bloc events.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "First Task",
        theme: lightTheme,
        home: const OnBoardingPage(),
      ),
    );
  }
}
