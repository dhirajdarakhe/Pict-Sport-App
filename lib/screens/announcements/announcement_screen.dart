

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:psa/screens/drawer/drawer.dart';

class Announcement_Screen extends StatefulWidget {
  const Announcement_Screen({Key? key}) : super(key: key);

  @override
  _Announcement_ScreenState createState() => _Announcement_ScreenState();
}

class _Announcement_ScreenState extends State<Announcement_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: App_Drawer(),
      ),
      appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,

          centerTitle: true,
          title: const Text('Announcements Screen',style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),leading:  IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.bullhorn,
          size: 25,color: Colors.black,
        ),
        onPressed: () {
          // do something
        },
      )
      ),
      body: Container(
        child:  const Center(
          child: Text(" ",style: TextStyle(
            color: Colors.grey,
          ),),
        ),
      ),
    );
  }
}

