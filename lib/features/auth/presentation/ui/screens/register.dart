import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_icons.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:lenguo_app/features/auth/presentation/ui/screens/login.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/auth_button.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/login_and_register_container.dart';
import 'package:lenguo_app/features/auth/presentation/ui/widgets/login_and_register_footer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account Created Successfully")),
                );

                Navigator.pop(context);
              }

              if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) => Column(
              children: [
                SizedBox(height: 60),
                LoginAndRegisterContainer(icon: AppIcons.registerIcon),
                SizedBox(height: 10),
                Text(
                  'Create Account 🚀',
                  style: AppTextStyle.loginAndRegisterTitle,
                ),
                SizedBox(height: 60),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'name',
                ),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),

                AuthButton(
                  onPressed: () {
                    context.read<AuthCubit>().register(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                  text: 'Register',
                ),
                LoginAndRegisterFooter(
                  text1: "Already have an account?",
                  text2: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Login()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
