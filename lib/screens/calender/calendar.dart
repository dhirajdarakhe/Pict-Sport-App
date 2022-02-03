import 'package:flutter/material.dart';
import 'package:psa/screens/calender/table_tennis/table_tannis_main_screen.dart';
import 'package:psa/screens/calender/table_tennis/table_tennis_issue_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
