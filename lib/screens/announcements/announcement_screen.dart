import 'package:flutter/material.dart';

class Announcement_Screen extends StatefulWidget {
  const Announcement_Screen({Key? key}) : super(key: key);

  @override
  _Announcement_ScreenState createState() => _Announcement_ScreenState();
}

class _Announcement_ScreenState extends State<Announcement_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Announcement Screen',style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
      ),
    );
  }
}
