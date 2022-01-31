import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/login_signUp/login_screen.dart';
import 'package:psa/screens/login_signUp/userInfo_screen.dart';
import 'package:psa/services/authentication.dart';
import 'package:psa/services/getUserData.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String misId='';
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC5CAE9),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*0.45,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/logo1.png'),
                      )
                  ),),
                const Text('Welcome to ',style: TextStyle(
                  color: Color(0xFF303F9F),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),),
                const Text('PICT SPORT APP',style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Authentication()
                        .signInWithGoogle(context)
                        .then((result) {
                      if (result == false) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetUserData()));
                      } else if (result == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfo()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/google.png'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text('Sign In With Google',style: TextStyle(
                              color: Color(0xFFCE93D8),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}