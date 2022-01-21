import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/login_signUp/login_screen.dart';

class Authentication
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    var authResult;
    try {
     authResult= await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     FirebaseFirestore.instance
     .collection('User').doc(authResult.user.uid)
     .set({
       'email':email,
       'name':UserDetails.name,
       'misId':UserDetails.misId,
     });
     UserDetails.email=email;

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut(context) async {
    await _auth.signOut();
    print('signout');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LogIn()),
            (route) => false);
  }

  //google sign in
  Future signInWithGoogle() async {
    late final isuser;
    try {
      // ignore: unused_local_variable
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
       // print(userCredential.user?.email);

        /*FirebaseFirestore.instance
        .collection('User').doc(userCredential.user?.uid).set({
          'email': userCredential.user?.email,
        });*/
      } else {
        print('ggooggle');
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
        isuser = userCredential.additionalUserInfo!.isNewUser;
        print(userCredential.user?.email);
        FirebaseFirestore.instance
        .collection('User')
        .doc(userCredential.user?.uid).set({
          'email': userCredential.user?.email,
          'name':userCredential.user?.displayName,
        });
        UserDetails.email=userCredential.user?.email;
        UserDetails.name=userCredential.user?.displayName;
      }
      return isuser;
    } catch (e) {
      return e;
    }
  }

  //microsoft sign in
  Future microsoftSignIn(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    bool isNewUser = false;
    User? user;
    try {
      user = await FirebaseAuthOAuth()
          .openSignInFlow(provider, scopes, parameters);
      String lastSignInTime = user!.metadata.lastSignInTime.toString();
      String creationTime = user.metadata.creationTime.toString();
      lastSignInTime = lastSignInTime.substring(0, lastSignInTime.length - 7);
      creationTime = creationTime.substring(0, creationTime.length - 7);
      // print(lastSignInTime);
      if (lastSignInTime == creationTime) {
        isNewUser = true;
      }
      return isNewUser;
    } on PlatformException catch (error) {
      return error;
    }
  }
}