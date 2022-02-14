import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          FlatButton(
            color: Colors.red,
            onPressed: ()
            {
            },
            child: const Text('Calendar',style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
          ),
        ],
      ),
    );
  }
}
