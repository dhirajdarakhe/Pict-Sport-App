import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/screens/Home/table_tennis/table_tannis_main_screen.dart';
import 'package:psa/screens/calender/table_tennis/table_tannis_main_screen.dart';
import 'package:psa/screens/calender/table_tennis/table_tennis_issue_screen.dart';
import 'package:psa/screens/drawer/drawer.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
          title: const Text('Calender Screen',style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),leading:  IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.calendarDay,
          size: 25,color: Colors.black,
        ),
        onPressed: () {
          // do something
        },
      )
      ),
      body: Center(
        child:FlatButton(
          color: Colors.red,
          onPressed: ()
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return TabletannisScreen();
                }));
          },
          child: const Text('Calendar',style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
        ),
      ),
    );
  }
}
