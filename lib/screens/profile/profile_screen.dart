import 'package:flutter/material.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Profile Screen',style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
      ),
    );
  }
}
