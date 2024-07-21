

import 'package:firease_study/screens/home_screen.dart';
import 'package:firease_study/screens/profile_page.dart';
import 'package:firease_study/screens/sign_in_page.dart';
import 'package:firease_study/screens/sign_up_page.dart';
import 'package:firease_study/screens/user_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnBPaPkNbZhLG1abZqDdcxPbOqS7g5FiA",
      appId: "1:611750427434:android:09b5f1077c165ab4557c53",
      messagingSenderId: "611750427434",
      projectId: "fir-e9ee0",
      storageBucket: 'gs://fir-e9ee0.appspot.com',
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
      routes: {
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfilePage(),
        '/userDetails': (context) => UserDetailsScreen(),
      },

    );
  }
}