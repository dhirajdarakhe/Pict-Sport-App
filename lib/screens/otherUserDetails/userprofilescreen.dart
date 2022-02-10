import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/screens/profile/profile_screen.dart';
import 'helper/card_item.dart';
import 'helper/stack_container.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherUserProfileScreeen extends StatefulWidget {
  late String uid;
  OtherUserProfileScreeen(
  {required this.uid}
      );

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

  late String email;//done
  late String misId;//done
  late String name;//done
  late String photourl;//done
  late Map sportList = {};//done
  List selectedSports = [];//done
  List selectedSportEmoji=[];//done
  late String aboutMe;//done
  late String achivement;//done
  late String dob;
  late String headline;
  late String insta ;//done
  late String linkedIn;//done
  late String twitter;//done
  late String whatappNo;//done
  late String location;
  late String rollNo;

  Future getDetails() async {
    var d =
    await FirebaseFirestore.instance.collection('User').doc(widget.uid).get();
    email = d.data()!['email'];
    misId = d.data()!['misId'];
    name = d.data()!['name'];
    sportList = d.data()!['SportList'];
    photourl = d.data()!['photourl'];
    aboutMe=d.data()!['aboutMe'];
    achivement=d.data()!['achievement'];
    dob=d.data()!['dob'];
    headline=d.data()!['headLine'];
    insta=d.data()!['insta'];
    linkedIn=d.data()!['linkedIn'];
    twitter=d.data()!['twitter'];
    whatappNo=d.data()!['whatAppNo'];
    location=d.data()!['location'];
    rollNo=d.data()!['rollNo'];
    selectedSports.clear();
    selectedSportEmoji.clear();
    for (var e in sportList.entries) {
      if (e.value == true) {
        selectedSports.add(e.key);
      }
    }

    for (int i=0;i<selectedSports.length;i++){
      if (selectedSports[i]=='BasketBall'){selectedSportEmoji.add('🏀');}
      if (selectedSports[i]=='VolleyBall'){selectedSportEmoji.add('🏐');}
      if (selectedSports[i]=='TableTennis'){selectedSportEmoji.add('🎾');}
      if (selectedSports[i]=='Badminton'){selectedSportEmoji.add('🏸');}
      if (selectedSports[i]=='Cricket'){selectedSportEmoji.add('🏏');}
      if (selectedSports[i]=='FootBall'){selectedSportEmoji.add('⚽');}
      if (selectedSports[i]=='Gym'){selectedSportEmoji.add('💪');}
      if (selectedSports[i]=='Chess'){selectedSportEmoji.add('♟');}
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  getDetails(),
      builder:(ctx, i){
        if (i.connectionState == ConnectionState.done){
          if (i.hasData){
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
                  //physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StackContainer(
                          imageUrl: photourl,
                          name: name,
                          misId: misId,
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        if (headline != null )
                          Padding(
                            padding: const EdgeInsets.only(left: 11.0, top: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                headline == null || headline == 'null'
                                    ? Container()
                                    : Text(
                                  headline.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0, top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              location == null || location == 'null'
                                  ? Container()
                                  : Text(
                                '${location.toString()} ',
                                style: const TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              const SizedBox(width: 5,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey),
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            color: Colors.white),
                                        child: IconButton(
                                            icon: const FaIcon(
                                              FontAwesomeIcons.instagram,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              if (insta=='null' || insta==null){
                                                ScaffoldMessenger.of(context).
                                                showSnackBar(const SnackBar(duration: Duration(seconds: 2),content:Text(
                                                    'Oops!! User have not provided Insta Url..'
                                                )));
                                              }
                                              else{
                                                _launchInWebViewOrVC(insta.toString());
                                              }

                                            }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey),
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            color: Colors.white),
                                        child: IconButton(
                                            icon: const FaIcon(
                                              FontAwesomeIcons.linkedinIn,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              if (linkedIn=='null' || linkedIn==null){
                                                ScaffoldMessenger.of(context).
                                                showSnackBar(const SnackBar(duration: Duration(seconds: 2),content:Text(
                                                    'Oops!! User have not provided LinkedIn Url..'
                                                )));
                                              }
                                              else{
                                                _launchInWebViewOrVC(linkedIn.toString());
                                              }

                                            }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey),
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            color: Colors.white),
                                        child: IconButton(
                                            icon: const FaIcon(
                                              FontAwesomeIcons.twitter,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              if (twitter=='null' || twitter==null){
                                                ScaffoldMessenger.of(context).
                                                showSnackBar(const SnackBar(duration: Duration(seconds: 2),content:Text(
                                                    'Oops!! User have not provided Twitter Url..'
                                                )));
                                              }
                                              else{
                                                _launchInWebViewOrVC(twitter.toString());
                                              }

                                            }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.grey),
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            color: Colors.white),
                                        child: IconButton(
                                            icon: const FaIcon(
                                              FontAwesomeIcons.phoneAlt,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              if (whatappNo=='null' || whatappNo==null){
                                                ScaffoldMessenger.of(context).
                                                showSnackBar(const SnackBar(duration: Duration(seconds: 2),content:Text(
                                                    'Oops!! User have not provided Mobile Number..'
                                                )));
                                              }
                                              else{
                                                _launchInWebViewOrVC('tel://$whatappNo');
                                              }

                                            }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5,),
                            ],
                          ),
                        ),
                        CardItem(
                          inputString1: 'MIS ID',
                          inputString2: misId,
                          inputString3: email,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '    Sports Intersected',
                                textAlign: TextAlign.start,
                                style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 11,right: 11),
                                child: Container(
                                  height: 75,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0, 1.0), // shadow direction: bottom right
                                      )
                                    ],
                                  ),
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: selectedSportEmoji.length,
                                    itemBuilder: (ctx, index) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 15, bottom: 10),
                                      child: Text(
                                        selectedSportEmoji[index],
                                        style: const TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _showData == false?
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showData = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "More Info",
                                    style: TextStyle(fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ):
                        /// && roll_no != null;
                         rollNo=='null' || rollNo==null?Container():
                         CardItem(inputString1: 'Roll No', inputString2: rollNo),
                        if (_showData == true)
                        /// &&  dob != null;
                         dob=='null' || dob==null?Container(): CardItem(
                              inputString1: 'Date of Birth',
                              inputString2: dob),
                        if (_showData == true)
                        /// &&  about_my_self != null;
                         aboutMe=='null' || aboutMe==null? Container():CardItem(
                              inputString1: 'About Myself',
                              inputString2:aboutMe),
                        if (_showData == true)
                        /// &&  about_my_self != null;
                          achivement=='null' || achivement==null? Container():CardItem(
                              inputString1: 'Achievement',
                              inputString2:achivement),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
