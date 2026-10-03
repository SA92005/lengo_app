import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/di/injection.dart';

// import 'package:lenguo_app/core/di/service%20locator.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:lenguo_app/features/auth/presentation/ui/screens/login.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => sl<AuthCubit>()),

        BlocProvider<LanguageSelectionCubit>(
          create: (context) => sl<LanguageSelectionCubit>(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Login()),
    );
  }
}
