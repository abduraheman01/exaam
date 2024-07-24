import 'package:firease_study/screens/upadte_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_page.dart';
import 'screens/sign_in_page.dart';
import 'screens/sign_up_page.dart';
import 'screens/user_details_screen.dart';


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
        '/updateProfile': (context) => UpdateProfilePage(),
        '/userDetails': (context) => UserDetailsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProfilePage(username: username),
          );
        }
        return null;
      },
    );
  }
}
