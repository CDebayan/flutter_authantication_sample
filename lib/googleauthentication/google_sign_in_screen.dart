import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInScreen extends StatelessWidget {
  static const id = "GoogleSignInScreen";

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
            button('Googlge Sign In', () {
              initGoogleSignIn();
            }),
            button('Googlge Sign Out', () {
              initGoogleSignOut();
            })
          ],),
        ),
      ),
    );
  }

  initGoogleSignIn() {
    GoogleSignIn().signIn().then((result) {
      print("success $result"); // displays the credential of the user selected
      result.authentication.then((googleKey) {
        FirebaseAuth.instance.signInWithCredential(GoogleAuthProvider.getCredential(
          accessToken: googleKey.accessToken,
          idToken: googleKey.idToken,
        )).then((result) {
          print("success $result"); // after sign in with firebase
          showToast("${result.user.email} is successfully logged in");
        }).catchError((error) {
          print("error $error");
        });
      }).catchError((error) {
        print("error $error");
      });
    }).catchError((error) {
      print("error $error");
    });
  }

  initGoogleSignOut() {
    GoogleSignIn().signOut();
    showToast('Logged Out');
  }
}
