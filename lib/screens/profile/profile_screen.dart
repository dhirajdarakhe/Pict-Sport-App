import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/profile/helper/widget/sport_container.dart';
import 'package:psa/services/authentication.dart';
import 'helper/widget/StackConatiner2.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
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
                        itemBuilder: (ctx, index) => Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, bottom: 10),
                            child: Container(
                              child: Text(
                                UserDetails.mySportEmoji![index],
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
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

              //   logout button

              const SizedBox(
                height: 18,
              ),
              Container(
                width: 250,
                height: 60,
                // margin: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  splashColor: Colors.lightBlueAccent,
                  elevation: 10.0,
                  shape: const StadiumBorder(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:const <Widget> [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black87,
                        size: 30,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Authentication().signOut(context);
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ));
  }
}

//
// onTap: (){
//
// },
// text: 'Logout',Icon:
// const