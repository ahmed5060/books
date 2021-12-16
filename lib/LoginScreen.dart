// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable

import 'package:books/Constatnt.dart';
import 'package:books/ForgetScreen.dart';
import 'package:books/HomeScreen.dart';
import 'package:books/SignUpScreen.dart';
import 'package:books/cubit/cubit.dart';
import 'package:books/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                        controller: emailController,
                        validate: (value){
                          if(value.isEmpty){
                            return 'please enter your Email';
                          }
                        },
                        prefix: Icons.perm_identity_outlined,
                        type: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        validate: (value){
                          if(value.isEmpty){
                            return 'please enter your password';
                          }
                        },
                        suffix: AppCubit.get(context).suffix,
                        isPassword: AppCubit.get(context).isPassword,
                        suffixPressed: (){
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
                        onPressed: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                                color: Color(0xff05445E),),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                  "Don't have an account?"
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Color(0xff189AB4),
                                    ),
                                  ),
                              ),
                            ],
                          ),

                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetScreen(),
                                ),
                              );
                            },
                              child: const Text(
                                'Forget Password',
                                style: TextStyle(
                                  color: Color(0xff189AB4),
                                ),
                              ),
                          ),
                        ],
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
