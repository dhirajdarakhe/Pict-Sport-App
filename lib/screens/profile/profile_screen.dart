import 'package:flutter/material.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  IconButton social(FaIcon i, String m) {
    return IconButton(
        onPressed: () {
          print('$m');
        },
        icon: i);
  }

  IconButton top_widget(Icon i, String m) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => sports_check()));
        },
        icon: i);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Stack(clipBehavior: Clip.none, children: <Widget>[
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                            ),
                            Text(
                              'My Profile',
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                color: Colors.grey[50],
                                fontSize: 30,
                              ),
                            ),
                            top_widget(
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                'vertical icon pressed'),
                          ],
                        ),
                      ),
                      height: height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)))),
                  Positioned(
                      top: height / 5.2,
                      left: width * 0.2888,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/omkar.png'),
                        radius: 75,
                      )),
                ]),
                SizedBox(
                  height: 27,
                ),
                RawMaterialButton(
                  onPressed: () {
                    print('edit icon ');
                  },
                  elevation: 0,
                  fillColor: Colors.grey[100],
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 12,
                  ),
                  shape: CircleBorder(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Omkar Awaje',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      social(FaIcon(FontAwesomeIcons.instagram), 'Instagram'),
                      social(FaIcon(FontAwesomeIcons.twitter), 'twitter'),
                      social(FaIcon(FontAwesomeIcons.facebook), 'Facebook'),
                      social(
                          FaIcon(FontAwesomeIcons.snapchatGhost), 'Snapchat'),
                    ]),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 2.0,
                  thickness: 2,
                  color: Colors.grey[100],
                ),
                SizedBox(
                  height: 30,
                ),
                container1('emoji.png', 'About Me', 'Hello I Am Omkar', 65, 65),
                SizedBox(height: 10),
                container1('mag.png', 'Roll Number', '21107', 50, 50),
                SizedBox(
                  height: 10,
                ),
                container1('cupcak.png', 'Birthday', '10/01/2002', 50, 50),
                SizedBox(
                  height: 10,
                ),
                container2(),
                SizedBox(
                  height: 10,
                ),
                container1('mail.png', 'Email', 'abc.xyz.com', 50, 50),
                SizedBox(
                  height: 10,
                ),
                container1('link.png', 'MIS ID', 'c2kobckeuu', 65, 65),
              ]),
            )),
      ),
    );
  }
}
