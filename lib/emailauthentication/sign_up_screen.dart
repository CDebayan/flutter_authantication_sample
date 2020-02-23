import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  static final String id = "SignUpScreen";
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
                  button('Register', () {
                    _initSignUp();
                  }),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initSignUp() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((createdUser) {
      print("success ${createdUser.user.email}");
      showToast("${createdUser.user.email} is successfully registered");
    }).catchError((error) {
      print("error ${error}");
      showToast(error.toString());
    });
  }
}
