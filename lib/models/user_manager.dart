import 'package:brunofirebaseapp/helpers/firebase_errors.dart';
import 'package:brunofirebaseapp/models/user.dart' as bruno;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManager extends ChangeNotifier{
  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User user;

  bool _loading = false;
  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> signIn(
      {bruno.User user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
             email: user.email, password: user.password);
      this.user = result.user;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> _loadCurrentUser() async {
    final User currentUser = await auth.currentUser;
    if(currentUser != null){
      user = currentUser;
      print('_loadCurrentUser --> ${user.uid}');
    }
    notifyListeners();
  }
}


