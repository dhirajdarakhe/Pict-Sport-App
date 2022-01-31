import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:psa/screens/chats/SportChatScreen.dart';
import 'package:psa/screens/chats/chat_screen.dart';
import 'package:psa/screens/login_signUp/signUp_screen.dart';
import 'package:psa/services/getUserData.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future isLoggedIn() async {
  FirebaseAuth.instance.currentUser!;
}

class MyApp extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user!=null){
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: GetUserData(),
        routes: {
          SportChatScreen.routeName: (ctx)=>SportChatScreen(),
        },
      );
    }else{
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Signup(),
        routes: {
          SportChatScreen.routeName: (ctx)=>SportChatScreen(),
        },
      );
    }
  }
}
