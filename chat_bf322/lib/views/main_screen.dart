import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/firebase_auth_controller.dart';
import 'auth/sign_in_screen.dart';
import 'home_screen.dart';
import 'splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.watch<FirebaseAuthController>().authStatus;
    switch(status){
      case AuthStatus.authenticate:
        return HomeScreen();
      case AuthStatus.unauthenticate:
        return SignInScreen();
      default:
        return SplashScreen();
    }
  }
}