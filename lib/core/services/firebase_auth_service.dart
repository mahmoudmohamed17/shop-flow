//here we type the core implementation of our desired methods
// then, in the auth repo we use the entity we construct via
// this User return type

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_flow/core/errors/custom_exception.dart';

class FirebaseAuthService {
  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('SignIn in Firebase service ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else {
        throw CustomException(message: 'An error occured, try again later.');
      }
    }
  }

  Future<User> signUp({required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('SignUp in Firebase service ${e.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'An error occured, please try again later.');
      }
    } catch (e) {
      throw CustomException(
          message: 'An error occured, please try again later.');
    }
  }
}
