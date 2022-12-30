import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sparrow_shop/Models/User.dart';
import 'package:sparrow_shop/Providers/ProductProvider.dart';
import 'package:sparrow_shop/Widgets/DialogHelper.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> register(AppUser _user, BuildContext context) async {
    bool success = false;
    await _auth.createUserWithEmailAndPassword(
        email: _user.email!, password: _user.password!)
        .then((value) async {
          success = true;
    }).catchError((onError){
      DialogHelper.showAlert(context,onError.message);
    });
    return success;
  }

  Future login(String email, String password,context) async {
    _auth.signInWithEmailAndPassword(email: email, password: password).then((value){

    }).catchError((onError){
      DialogHelper.showAlert(context,onError.message);
    });
  }

  void logout(context) async {
    await _auth.signOut();
    DialogHelper.showAlert(context, "Logged out successfully");
  }

  Stream<User?> get userStream {
    return _auth.authStateChanges();
  }

}
