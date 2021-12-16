// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:books/LoginScreen.dart';
import 'package:books/ScanScreen.dart';
import 'package:books/SubjectsScreen.dart';
import 'package:books/cubit/cubit.dart';
import 'package:books/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xff05445E),
              selectedItemColor: Color(0xff75E6DA),
              unselectedItemColor: Colors.white,
              iconSize: 30,
              currentIndex: selectedIndex,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              unselectedFontSize: 15,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home,
                    ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_scanner_outlined,
                  ),
                  label: 'Scan',
                ),
              ],
            ),
            body: getScreen(),
            appBar: AppBar(
              backgroundColor: const Color(0xff05445E),
              title: const Text(
                'App Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget getScreen(){
    if(selectedIndex == 0){
      return SubjectsScreen();
    }else {
      return ScanScreen();
    }
  }
}
