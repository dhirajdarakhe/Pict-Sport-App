import 'package:flutter/material.dart';

class TableStatusPopup extends StatefulWidget {
  TableStatusPopup({required this.tableno, required this.unEnrollSeats});
  final String tableno;
  final int unEnrollSeats;
  @override
  _TableStatusPopupState createState() => _TableStatusPopupState();
}

class _TableStatusPopupState extends State<TableStatusPopup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.tableno,
              style: const TextStyle(fontSize: 21),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'Total seats',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Container(
                  child: const Text(
                    '            = 4',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'Remains seats',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Container(
                  child:  Text(
                    '   = ${widget.unEnrollSeats}',
                    style: const TextStyle(fontSize: 21),
                  ),
                ),
              ],
            ),
            if (4 <= widget.unEnrollSeats)
              Row(
                children: <Widget>[
                  Container(
                    child: const Center(
                      child: Text(
                        '\n🥺   Sorry Seats are\n not Available',
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                  ),
                ],
              ),
            if (4 > widget.unEnrollSeats)
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const Center(
                    child: Text(
                      'You Can Enroll for remaining seats',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),),
              ),
            // )
          ],
        ),
      ),
    );
  }
}
