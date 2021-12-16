// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:books/LoginScreen.dart';
import 'package:books/SignUpScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {

  final Widget svgIcon = SvgPicture.asset("assets/images/2.svg",height: 500,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4f6f6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                svgIcon,
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 55.0),
                  textColor: Colors.white,
                  color: const Color(0xff05445E),
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => LoginScreen(),
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
                  height: 20,
                ),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 55.0),
                  textColor: Colors.white,
                  color: const Color(0xff189AB4),
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Color(0xff189AB4),),
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
  }
}
