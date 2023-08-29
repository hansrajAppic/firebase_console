import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GmailLoginCustom{
    
   



          static Future<User?> signInWithGoogle({required FirebaseAuth auth}) async {
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);
        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);

          user = userCredential.user;

        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
            // ToastUtils.showToast(kSocialLoginToastErrorMsg);
            print("Gmail login::::account-exists-with-different-credential");
          } else if (e.code == 'invalid-credential') {
            // ...
            // ToastUtils.showToast(kSocialLoginToastErrorMsg);
            print("Gmail login::::invalid-credential");
          }
        } catch (e) {
          // ...
          // ToastUtils.showToast(kSocialLoginToastErrorMsg);
          print("Gmail login::::e");
        }
      }
    }

    return user;
  }


  static Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {

      print( "Something went wrong:::::::::$e");
    }
  }

}