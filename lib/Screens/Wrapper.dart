
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparrow_shop/Screens/Home.dart';
import 'package:sparrow_shop/Screens/Login.dart';

class Wrapper extends StatelessWidget {

  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return user == null
        ? const Login()
        : const Home();
  }
}
