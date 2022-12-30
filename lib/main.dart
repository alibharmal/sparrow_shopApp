import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparrow_shop/Config/Theme.dart';
import 'package:sparrow_shop/Respository/Firebase_AuthRepository.dart';
import 'package:sparrow_shop/Screens/Login.dart';
import 'package:sparrow_shop/Screens/Wrapper.dart';
import 'package:sparrow_shop/firebase_options.dart';
import 'Providers/ProductProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child:  StreamProvider<User?>.value(
          value: authService.userStream,
          initialData: null,
          child:  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: Wrapper(),
          )),
    );
  }
}
