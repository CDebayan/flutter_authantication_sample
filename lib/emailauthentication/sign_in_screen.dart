import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/emailauthentication/sign_up_screen.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatelessWidget {
  static final String id = "SignInScreen";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16, right: 16),
            children: <Widget>[
              inputTextField('Email', _emailController),
              inputTextField('password', _passwordController),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  button('LogIn', () {
                    _initSignIn();
                  }),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initSignIn() {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text
    ).then((signedInUser){
      showToast("${signedInUser.user.email} is successfully logged in");
    }).catchError((error){
      showToast(error.toString());
    });
  }
}
