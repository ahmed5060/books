// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:books/Constatnt.dart';
import 'package:books/cubit/cubit.dart';
import 'package:books/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {

  var nationalController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            backgroundColor: const Color(0xffe4f6f6),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo2.jpeg'),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: nationalController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your Identification Number';
                          }
                        },
                        prefix: Icons.perm_identity,
                        type: TextInputType.emailAddress,
                        label: 'Identification Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: emailController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        prefix: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        label: 'Email address',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your password';
                          }
                        },
                        suffix: AppCubit.get(context).suffix,
                        onSubmit: (value) {},
                        isPassword: AppCubit.get(context).isPassword,
                        suffixPressed: () {
                          AppCubit.get(context).changePasswordVisibility();
                        },
                        prefix: Icons.vpn_key_outlined,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: password2Controller,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your password';
                          }
                        },
                        suffix: AppCubit.get(context).suffix,
                        onSubmit: (value) {},
                        isPassword: AppCubit.get(context).isPassword,
                        suffixPressed: () {
                          AppCubit.get(context).changePasswordVisibility();
                        },
                        prefix: Icons.vpn_key_outlined,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 55.0),
                        textColor: Colors.white,
                        color: const Color(0xff05445E),
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xff05445E),),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
