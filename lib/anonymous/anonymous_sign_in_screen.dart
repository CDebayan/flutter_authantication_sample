import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';

class AnonymousSignInScreen extends StatelessWidget {
  static const id = "AnonymousSignInScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: button('Anonymous Sign In', () {
            _initAnonymousSignIn();
          }),
        ),
      ),
    );
  }

  _initAnonymousSignIn() {
    FirebaseAuth.instance.signInAnonymously().then((result) {
      print(result.user);
      showToast("${result.user.uid} is successfully registered");
    }).catchError((error) {
      print(error);
    });
  }
}
