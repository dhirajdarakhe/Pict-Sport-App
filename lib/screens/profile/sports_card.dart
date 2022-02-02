import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card1.dart';
import 'Sports_list.dart';
import 'check.dart';

List l3 = <String>[];

class container2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List l = <String>[];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.3,
      width: width * 0.98,
      child: Card(
        elevation: 40,
        shadowColor: Colors.grey[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sports Interested',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            sport(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class sport extends StatefulWidget {
  const sport({Key? key}) : super(key: key);

  @override
  _sportState createState() => _sportState();
}

class _sportState extends State<sport> {
  @override
  String sp = '';
  double si = 32;
  void set1() {
    setState(() {
      sp = conver();
      si = siz();
    });
  }

  Widget build(BuildContext context) {
    set1();
    return Text(
      '$sp',
      style: TextStyle(fontSize: 45 - 2 * si),
    );
  }
}

/*
Image(
      image: AssetImage('assets/ball.png'),
      width: 35,
      height: 35,)
*/
