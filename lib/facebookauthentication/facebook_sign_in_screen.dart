import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSignInScreen extends StatelessWidget {
  static const id = "FacebookSignInScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              button('Facebook Sign In', () {
                initFacebookSignIn();
              }),
              button('Facebook Sign Out', () {
                initLogout();
              })
            ],
          ),
        ),
      ),
    );
  }

  initFacebookSignIn() async {
    FacebookLogin().logIn(['email']).then((result) {
      print(result);
      FirebaseAuth.instance
          .signInWithCredential(FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token))
          .then((result) {
        print("success $result"); // after sign in with firebase
        showToast("${result.user.email} is successfully logged in");
      }).catchError((error) {
        print("error $error");
      });
    }).catchError((error) {
      print(error);
    });
  }

  initLogout() {
    FacebookLogin().logOut();
    showToast('Logged Out');
  }
}
