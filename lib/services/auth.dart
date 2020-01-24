import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/userData.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Logger logger = Logger();

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static dynamic signUpUser(
    BuildContext context,
    String name,
    String email,
    String _username,
    String password,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    try {
      print(email);
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl': '',
          'username': _username,
        });
        Provider.of<UserData>(context, listen: false).currentUserId =
            signedInUser.uid;
        Navigator.pushReplacementNamed(context, 'home_page');
      }
    } catch (error) {
      String errorMessage;
      switch (error.message) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = error.message;
      }
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          elevation: 0,
          content: Container(
            height: 25,
            child: Center(
              child: Text(errorMessage),
            ),
          ),
        ),
      );
    }
  }

  static void logout() {
    _auth.signOut();
  }

  static void login(
    String email,
    String password,
    GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext context,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, 'home_page');
    } catch (e) {
      bool isReceptive = true;
      String message = '';
      if (e.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        message = 'Invalid email or password';
      } else if (e.message == 'The email address is badly formatted.') {
        message = e.message;
      } else {
        logger.e('Login Error: $message');
        message = e.message;
        isReceptive = false;
      }

      if (isReceptive) {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
            elevation: 0,
            content: Container(
              height: 25,
              child: Center(
                child: Text(message),
              ),
            ),
          ),
        );
        logger.i(
          'Failed to login: $email with $password \nTime: ${DateTime.now()}',
        );
      } else {
        logger.e(
            'Login error: $message \nTime:${DateTime.now()}\nVariables: \n   email: $email\n   password:$password');
      }
    }
  }
}
