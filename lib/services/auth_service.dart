import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => value.user?.updateDisplayName(name));

      FirebaseDatabase.instance.ref().child('users').child(name).set({"nama": name});

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      String? message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
      );
    }
    catch (e) {
        // Catch any other errors
    }
  }

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacementNamed(
        context, '/home');

    } on FirebaseAuthException catch (e) {
      String? message = '';
      message = e.code;
      if (e.code == 'user-not-found') {
        message = 'no user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = "Wrong password provided for that user";
      }
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
      );
    } catch (e) {
      // Catch any other errors
    }
  }

  Future<void> signOut({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(
        context, '/login');
  }

  Future<String?> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    } else {
      return user.displayName;
    }
  }

}
