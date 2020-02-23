import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/facebookauthentication/facebook_sign_in_screen.dart';
import 'package:flutter_authantication_sample/phoneauthantication/phone_sign_in_screen.dart';
import 'package:flutter_authantication_sample/screens/home_page_screen.dart';
import 'anonymous/anonymous_sign_in_screen.dart';
import 'emailauthentication/sign_in_screen.dart';
import 'emailauthentication/sign_up_screen.dart';
import 'googleauthentication/google_sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePageScreen.id,
      routes: {
        HomePageScreen.id : (context)=> HomePageScreen(),
        SignUpScreen.id : (context)=> SignUpScreen(),
        SignInScreen.id : (context)=> SignInScreen(),
        GoogleSignInScreen.id : (context)=> GoogleSignInScreen(),
        FacebookSignInScreen.id : (context)=> FacebookSignInScreen(),
        PhoneSignInScreen.id : (context)=> PhoneSignInScreen(),
        AnonymousSignInScreen.id : (context)=> AnonymousSignInScreen(),
      },
    );
  }
}
