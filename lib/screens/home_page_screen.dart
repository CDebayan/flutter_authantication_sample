import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/anonymous/anonymous_sign_in_screen.dart';
import 'package:flutter_authantication_sample/emailauthentication/sign_in_screen.dart';
import 'package:flutter_authantication_sample/facebookauthentication/facebook_sign_in_screen.dart';
import 'package:flutter_authantication_sample/googleauthentication/google_sign_in_screen.dart';
import 'package:flutter_authantication_sample/phoneauthantication/phone_sign_in_screen.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';

class HomePageScreen extends StatelessWidget {
  static final String id = "HomePageScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buttonList(context),
      ),
    );
  }

  _buttonList(BuildContext context) {
    return ListView(
      children: <Widget>[
        button('Authantication', () {
          Navigator.pushNamed(context, SignInScreen.id);
        }),

        button('Google', () {
          Navigator.pushNamed(context, GoogleSignInScreen.id);
        }),

        button('Facebook (In Progress)', () {
          Navigator.pushNamed(context, FacebookSignInScreen.id);
        }),

        button('Phone', () {
          Navigator.pushNamed(context, PhoneSignInScreen.id);
        }),

        button('Anonymous', () {
          Navigator.pushNamed(context, AnonymousSignInScreen.id);
        }),
      ],
    );
  }
}



