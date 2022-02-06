import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/screens/otherUserDetails/helper/card_item.dart';
import 'package:psa/screens/otherUserDetails/helper/stack_container.dart';
import 'package:psa/screens/profile/helper/widget/sport_container.dart';

import 'helper/widget/StackConatiner2.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StackContainer2(
                imageUrl:
                    'https://lh3.googleusercontent.com/a-/AOh14GiI2oRbxg9hBNUSaJE4WVIJMJpRrGHAubWB-BpTzw=s96-c',
                name: 'widget.name',
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 35,
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 35,
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 35,
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.phoneAlt,
                            size: 30,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: EmailORMisId2(mail: 'dhirajdarakhe@gamil.com',misid: "c2k220106749@pict.edu",),
              ),
              Padding(
                child: sportContainer(fondSize: 14,
                    headline: "Achievement in sport",
                    Discription:
                        "The greatest achievement in my life would have to be my success in the sport of football. "
                        " I started playing the game at the age of eight.  It stuck with me throughout my life until now. "),
                padding:
                    const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: sportContainer(fondSize: 14,
                  headline: "Skill in sport",
                  Discription: 'Time Management\n'
                      'LeaderShip\n'
                      'Communication',
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: sportContainer(fondSize: 23,
                  headline: "Interested sport",
                  Discription: '🏀  '
                '🏐  '
                '🎾  '
                '🏏  '
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: sportContainer(
                    headline: "About myself ",
                    Discription: 'This is dhiraj , I\'m interested in playing cricket , football , table tennis', fondSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
}
