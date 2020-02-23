import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authantication_sample/widgets/widgets.dart';

class PhoneSignInScreen extends StatelessWidget {
  static const id = "PhoneSignInScreen";
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            inputTextField('Phone No', _phoneController),
            inputTextField('OTP', _otpController),
            Row(
              children: <Widget>[
                button('GET OTP', () {
                  getOtp();
                }),
                button('Submit', () {
                  verifyOtp();
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  getOtp() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneController.text.toString().trim(),
        timeout: Duration(seconds: 5),
        verificationCompleted: (phoneAuthCredential){
          print("verificationCompleted : $phoneAuthCredential");
        },
        verificationFailed: (error){
          print("verificationFailed : ${error.message}");
        },
        codeSent: (verificationId, [int forceResendingToken]){
          this.verificationId = verificationId;
          print("codeSent : ${verificationId} ${forceResendingToken}");
        },
        codeAutoRetrievalTimeout: (verificationId){
          print("codeAutoRetrievalTimeout $verificationId");
        });
  }

  verifyOtp() {
    FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: _otpController.text.toString().trim(),
    )).then((result){
      print("result ${result.user.phoneNumber}");
    }).catchError((error){
      print("error ${error}");
    });
  }
}
