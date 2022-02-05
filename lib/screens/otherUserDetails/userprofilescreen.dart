import 'package:flutter/material.dart';
import 'helper/card_item.dart';
import 'helper/stack_container.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class OtherUserProfileScreeen extends StatelessWidget {
  OtherUserProfileScreeen(
      {required this.name,
      required this.mis,
      required this.email,
      required this.photourl});
  String? mis;
  String? photourl;
  String? name;
  String? email;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      backgroundColor: Colors.white,
      // floatingActionButton: SizedBox(
      //   height: 60.0,
      //   width: 70.0,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //         backgroundColor: const Color(0xff0d4d11),
      //         child: const Icon(Icons.email_rounded),
      //         onPressed: () {}),
      //   ),
      // ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: const Color(0xff0d4d11),
          children: [
            SpeedDialChild(
              onTap: () {},
              backgroundColor: Colors.green,
              labelBackgroundColor: Colors.green,
              child: const Icon(Icons.mail),
              label: 'mail',
            ),
            SpeedDialChild(
              onTap: () {},
              backgroundColor: Colors.green,
              labelBackgroundColor: Colors.green,
              child: const Icon(Icons.message),
              label: 'message',
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              StackContainer(
                imageUrl: photourl,
                name: name,
              ),
              const SizedBox(
                height: 18.0,
              ),
              CardItem(
                inputString1: 'MIS ID',
                inputString2: '$mis',
              ),
              CardItem(
                inputString1: 'ROLL NO',
                inputString2: '21118',
              ),
              CardItem(
                  inputString1: 'About Myself',
                  inputString2:
                      'This is ${name}, I\'m interested in Cricket , Football Games')
              // ListView.builder
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) => CardItem(
              //
              //   ),
              //   shrinkWrap: true,
              //   itemCount: 2,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
