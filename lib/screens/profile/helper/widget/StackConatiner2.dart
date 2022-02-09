import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/profile/helper/widget/custom_clipper2.dart';
import '../../profile_edit_srcreen.dart';

class StackContainer2 extends StatelessWidget {

  StackContainer2();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: (UserDetails.headline==null || UserDetails.headline=='null')
          && (UserDetails.rollNo==null || UserDetails.rollNo=='null')
          && (UserDetails.birthday==null || UserDetails.birthday=='null')
          && (UserDetails.location==null || UserDetails.location=='null')?
      height*0.42:
      (UserDetails.headline==null || UserDetails.headline=='null')
          || (UserDetails.rollNo==null || UserDetails.rollNo=='null')
          || (UserDetails.birthday==null || UserDetails.birthday=='null')
          || (UserDetails.location==null || UserDetails.location=='null')
          ?height*0.47:
      height*0.52,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper2(),
            child: Container(
              height: height*0.37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black, width: 5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(6, 3),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9DcR1UKPNaaRtjfAEojtO_lbwggqEPUfgow&usqp=CAU"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment:  const Alignment(1,0.5),
              child: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.pencilAlt,
                    size: 29,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return EditProfileScreen();
                        }));
                  }),
          ),
          Positioned(
            top: 120,
            left: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(UserDetails.photourl.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    UserDetails.name.toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     UserDetails.headline==null || UserDetails.headline=='null'?Container(): Text(
                        UserDetails.headline.toString(),
                        style: const TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      UserDetails.rollNo==null || UserDetails.rollNo=='null'?Container(): Text(
                            UserDetails.rollNo.toString(),
                        style: const TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pune Institute of Computer Technology, Pune.",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      UserDetails.misId![0].toString()=='C'
                          ||  UserDetails.misId![0].toString()=='c'? const Text(
                        'Computer',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ):UserDetails.misId![0]=='I'
                          || UserDetails.misId![0]=='i'? const Text(
                        'Information Technology',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ):UserDetails.misId![0]=='E'
                          || UserDetails.misId![0]=='e'?const Text(
                        'Electronics',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ):Container(),
                      UserDetails.birthday=='null' || UserDetails.birthday==null?Container(): Text(
                        UserDetails.birthday.toString(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      UserDetails.location==null || UserDetails.location=='null'?Container(): Text(
                        UserDetails.location.toString(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmailORMisId2 extends StatefulWidget {
  String? mail;
  String? misid;
  EmailORMisId2({required this.mail, required this.misid});
  @override
  _EmailORMisId2State createState() => _EmailORMisId2State();
}

class _EmailORMisId2State extends State<EmailORMisId2> {
  bool _isMail = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              child: Icon(
                Icons.mail,
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Icon(
                  //   Icons.mail,
                  //   size: 35,
                  // ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMail = false;
                          });
                        },
                        child: Text(
                          "MIS ID",
                          style: TextStyle(
                            color: !_isMail ? Colors.black : Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const Text(
                        " / ",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMail = true;
                          });
                        },
                        child: Text(
                          "EMAIL ID",
                          style: TextStyle(
                            color: _isMail ? Colors.black : Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: 250,
                    child: SelectableText(
                      _isMail ? '${widget.mail}' : '${widget.misid}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
