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
              button('Facebook Sign Out', () {})
            ],
          ),
        ),
      ),
    );
  }

  initFacebookSignIn() async {
    FacebookLogin().logIn(['email']).then((result) {
      print(result);
    }).catchError((error) {
      print(error);
    });
  }
}
