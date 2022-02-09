import 'package:flutter/material.dart';
import 'helper/card_item.dart';
import 'helper/stack_container.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherUserProfileScreeen extends StatefulWidget {
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
  State<OtherUserProfileScreeen> createState() =>
      _OtherUserProfileScreeenState();
}

class _OtherUserProfileScreeenState extends State<OtherUserProfileScreeen> {
  Future<void>? _launched;
  Future _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      print('couldn\'t send tthe email');
      throw 'Could not launch $url';
    }
  }

  bool _showData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: const Color(0xff0d4d11),
          children: [
            SpeedDialChild(
              onTap: () {
                setState(() {
                  _launched = _launchInWebViewOrVC(''/// sending mail isn't implemented yet
                      'https://www.google.com/search?q=google&oq=google&aqs=chrome.'
                      '.69i57j46i131i199i433i465i512j69i59l2j0i131i433i512l3j0i433i512j0i131i433i512l2.3272j0j'
                      '15&sourceid=chrome&ie=UTF-8');
                });
              },
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StackContainer(
                  imageUrl: widget.photourl,
                  name: widget.name,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                CardItem(
                  inputString1: 'MIS ID',
                  inputString2: '${widget.mis}',
                  inputString3: '${widget.email}',
                ),
                CardItem(
                  inputString1: 'Sport ',
                  inputString2: '🏀  BasketBall  '
                      '🏐  VolleyBall  \n\n'
                      '🎾  TableTennis  '
                      '🏏  Cricket',
                ),
                if (_showData == false)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showData = true;
                        });
                      },
                      child: const Text(
                        "more info",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                if (_showData == true)

                  /// && roll_no != null;
                  CardItem(inputString1: 'Roll No', inputString2: ' 21118 '),
                if (_showData == true)

                  /// &&  dob != null;
                  CardItem(
                      inputString1: 'Date of Birth',
                      inputString2: ' 21 - 05 - 2003 '),
                if (_showData == true)

                  /// &&  about_my_self != null;
                  CardItem(
                      inputString1: 'About Myself',
                      inputString2:
                          ' This is Dhiraj From se: 01, I\'m interested in playing cricket, football, hocky and many games, '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ListView.builder
//   physics: const NeverScrollableScrollPhysics(),
//   itemBuilder: (context, index) => CardItem(
//
//   ),
//   shrinkWrap: true,
//   itemCount: 2,
// )
