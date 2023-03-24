import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider with ChangeNotifier
{
  final googleSignIn=GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get  user=>_user;

  Future googleLogin() async
  {
    try
    {
      final googleUser=await googleSignIn.signIn();
      if(googleUser==null)
      {
        return;
      }
      else
      {
        _user=googleUser;
      }
      final googleAuth=await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print('ahjsbjdh');
      print('${credential}');
      await FirebaseAuth.instance.signInWithCredential(credential);


    }catch(e)
    {
      print('ajhsbdhj');
      print('${e}');
    }

  }

}