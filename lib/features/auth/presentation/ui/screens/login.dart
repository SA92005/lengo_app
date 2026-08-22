import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_icons.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:lenguo_app/features/auth/presentation/ui/screens/home_screen.dart';
import 'package:lenguo_app/features/auth/presentation/ui/screens/register.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/auth_button.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/login_and_register_container.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/login_and_register_footer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) => Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    LoginAndRegisterContainer(icon: AppIcons.loginIcon),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Welcome Back 👋',
                        style: AppTextStyle.loginAndRegisterTitle,
                      ),
                    ),
                    Text(
                      'Login to continue your language learning journey.',
                      style: AppTextStyle.loginAndRegisterSubtitle,
                      textAlign: .center,
                    ),
                    SizedBox(height: 60),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'e-mail',
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'password',
                      isObsecure: isObsecure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(
                          isObsecure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    AuthButton(
                      onPressed: () {
                        context.read<AuthCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      },
                      text: 'login',
                    ),
                    LoginAndRegisterFooter(
                      text1: "Don't have an account?",
                      text2: 'Register',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
