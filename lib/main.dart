import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/di/service%20locator.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:lenguo_app/features/auth/presentation/ui/screens/login.dart';
import 'package:lenguo_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(const LenguoApp());
}

class LenguoApp extends StatelessWidget {
  const LenguoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Login()),
    );
  }
}
