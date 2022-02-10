import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/profile/helper/widget/sport_container.dart';
import 'package:psa/screens/profile/profile_edit_srcreen.dart';
import 'package:psa/services/authentication.dart';
import 'package:url_launcher/url_launcher.dart';
import 'helper/widget/StackConatiner2.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {


  Future<void> _launchedInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              StackContainer2(),
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
                          onPressed: () {
                            if (UserDetails.instaUrl=='null' || UserDetails.instaUrl==null){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(duration: const Duration(seconds: 1),content:
                              DifferentPlatformWidget(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return EditProfileScreen();
                                }));
                              }, name: 'Instagram',)));
                            }
                           else{
                              _launchedInBrowser(UserDetails.instaUrl.toString());
                            }

                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 35,
                          ),
                          onPressed: () {
                            if (UserDetails.twitterUrl=='null' || UserDetails.twitterUrl==null){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(duration: const Duration(seconds: 1),content:
                              DifferentPlatformWidget(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return EditProfileScreen();
                                }));
                              }, name: 'Twitter',)));
                            }
                            else{
                              _launchedInBrowser(UserDetails.twitterUrl.toString());
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 35,
                          ),
                          onPressed: () {
                            if (UserDetails.linkedInUrl=='null' || UserDetails.linkedInUrl==null){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(duration: const Duration(seconds: 1),content:
                              DifferentPlatformWidget(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return EditProfileScreen();
                                }));
                              }, name: 'LinkedIn',)));
                            }
                            else{
                              _launchedInBrowser(UserDetails.linkedInUrl.toString());
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.phoneAlt,
                            size: 30,
                          ),
                          onPressed: () {
                            if (UserDetails.whatAppNo=='null' || UserDetails.whatAppNo==null){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(duration: const Duration(seconds: 1),content:
                              DifferentPlatformWidget(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return EditProfileScreen();
                                }));
                              }, name: 'WhatApp Number',)));
                            }
                            else{
                              _launchedInBrowser('tel://${UserDetails.whatAppNo}');
                            }
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: EmailORMisId2(
                  mail: UserDetails.email,
                  misid: UserDetails.misId,
                ),
              ),
              UserDetails.achivement == null || UserDetails.achivement == 'null'
                  ? Container()
                  : Padding(
                      child: sportContainer(
                          fondSize: 17,
                          headline: "Achievement in sport",
                          Discription: UserDetails.achivement),
                      padding: const EdgeInsets.only(
                          left: 11.0, right: 11, bottom: 15),
                    ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sports Intersected',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 75,
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: UserDetails.mySportEmoji?.length,
                        itemBuilder: (ctx, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Text(
                            UserDetails.mySportEmoji![index],
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UserDetails.aboutMe == null || UserDetails.aboutMe == 'null'
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 11.0, right: 11, bottom: 15),
                      child: sportContainer(
                        headline: "About myself ",
                        Discription: UserDetails.aboutMe,
                        fondSize: 17,
                      ),
                    ),
            ],
          ),
        ));
  }
}

class DifferentPlatformWidget extends StatelessWidget {
  late String name;
  VoidCallback onTap;
  DifferentPlatformWidget({required this.name,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      //color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Text('$name url not provided.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              color: Colors.redAccent,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Fill url'),
                )),
          )
        ],
      ),
    );
  }
}

//
// onTap: (){
//
// },
// text: 'Logout',Icon:
// const