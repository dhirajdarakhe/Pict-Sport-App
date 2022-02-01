import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
          child: Text('Home Screen',
            style: TextStyle(color: Colors.white,fontSize: 20,),),
        ),
      );
    //arthssjsj
  }
}
