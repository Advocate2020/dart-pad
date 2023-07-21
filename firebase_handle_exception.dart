import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
     
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       print('No user found with the provided credentials.');
       
      } else if (e.code == 'wrong-password') {
        print(
          'Incorrect email or pasword.');
       
      } else if (e.code == 'error-wrong-pasword') {
        print(
         'Incorrect email or pasword.'
        );
      } else {
        // Handle other FirebaseAuthException error codes if needed
        // For example: 'ERROR_INVALID_EMAIL', 'ERROR_USER_DISABLED', etc.
        print(
         'An error occurred during login. Please try again later.'
        );
      }
    } on PlatformException catch (e) {     
      if (e.message ==
          'ERROR_WRONG_PASSWORD') {
        print(
        'Incorrect email or password.'
        );
      } else if (e.code == 'ERROR_USER_NOT_FOUND') {
        print(
        'Incorrect email or password.'
        );
      }
    } catch (e) {
      // Handle any other exceptions that might occur during the login process
      // For example, network errors or unexpected errors
      print(
       'An error occurred during login. Please try again later.'
      );
    }
  }
