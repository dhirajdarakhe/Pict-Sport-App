import 'package:flutter/material.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: const Center(
            child: Text('Profile',style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),),
          ),
        ),
      ),
    );
  }
}
