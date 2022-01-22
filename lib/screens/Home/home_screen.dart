import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/services/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Text(UserDetails.email.toString(),style: TextStyle(fontSize: 20,color: Colors.blue),),
        SizedBox(height: 20,),
        InkWell(
          onTap: () {
            Authentication().signOut(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.login_sharp,
                color: Colors.blue,
              ),
              SizedBox(width: 15),
              Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('HomeScreen',style: const TextStyle(color: Colors.red),),
      ),
      body: Center(
        child: Container(
          color: Colors.blue.withOpacity(0.2),
          child: GestureDetector(
            onTap: (){
            },
            child: const Text('Welcome to PICT SPORT APP',style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),),
          ),
        ),
      ),
    );
  }
}
