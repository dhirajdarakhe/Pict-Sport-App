import 'package:flutter/material.dart';
import 'package:psa/screens/Home/home_screen.dart';
import 'package:psa/screens/login_signUp/signUp_screen.dart';
import 'package:psa/screens/login_signUp/userInfo_screen.dart';
import 'package:psa/services/authentication.dart';
import 'package:psa/services/getUserData.dart';
/*
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC5CAE9),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 40,),
                GestureDetector(
                  onTap: (){
                    Authentication()
                        .signInWithGoogle()
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
                                builder: (context) => HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                            SizedBox(width: 5,),
                            const Text('Login In With Google',style: TextStyle(
                              color: Color(0xFFCE93D8),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text('Dont have an account?',style:TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 19,
                    ),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Signup();
                        }));
                      },
                      child: const Text('SignUp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                        fontSize: 20,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/