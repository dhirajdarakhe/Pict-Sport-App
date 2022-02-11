import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  static String hiddenHeadLine="Ex: BasketBall Player";
  static String hiddenRollNo="00000";
  static String hiddenLocation="Ex:Aurangabad,Maharashtra";
  static String hiddenAchivement="Ex: State Level BasketBall Player";
  static String hiddenAboutMe="Minimum 10 words required";
  static String hiddenInsta="";

  var _day,_month,_year;

  Future _onSubmit() async{
    try {
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();
        if (dob==UserDetails.birthday){
          print('euu');
          print(dob);
          print(UserDetails.birthday);
        }
        if (headline==hiddenHeadLine){headline=null;}
        if (rollNo==hiddenRollNo){rollNo=null;}
        if (location==hiddenLocation){location=null;}
        if (achivement==hiddenAchivement){achivement=null;}
        if (aboutUrSelf==hiddenAboutMe){aboutUrSelf=null;}
        if (insta==hiddenInsta){insta=null;}
        if (twit==hiddenInsta){twit=null;}
        if (link==hiddenInsta){link=null;}
        if (mobile==hiddenInsta){mobile=null;}

        FirebaseFirestore.instance
            .collection('User').doc(UserDetails.uid)
            .update({
          'headLine':headline,
          'rollNo':rollNo,
          'location':location,
          'achievement':achivement,
          'aboutMe':aboutUrSelf,
          'insta':insta,
          'linkedIn':link,
          'twitter':twit,
          'whatAppNo':mobile,
          'dob':UserDetails.birthday,
        });
        setState(() {
          UserDetails.headline=headline;
          UserDetails.rollNo=rollNo;
          UserDetails.location=location;
          UserDetails.achivement=achivement;
          UserDetails.aboutMe=aboutUrSelf;
          UserDetails.instaUrl=insta;
          UserDetails.linkedInUrl=link;
          UserDetails.twitterUrl=twit;
          UserDetails.whatAppNo=mobile;
          UserDetails.birthday=dob;
        });
        Navigator.pop(context);

      } else {
        print("null is being printed <=");
      }
    } catch (e) {
      print("Error caught while summiting the form");
      print(e);
    }
  }

  final formkey = GlobalKey<FormState>();
  String? headline;
  String? rollNo;
  String? location;
  String? achivement;
  String? aboutUrSelf;
  String? insta, twit, link, mobile;
  DateTime datetime = DateTime.now();
  String? dob;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // to remove back button
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
            /*Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return Profile_Screen();
                }));*/
            // );
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 0),
            child: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              print("Form is being submitted");
              _onSubmit();
            },
            child: const Icon(
              Icons.done_rounded,
              size: 38,
              color: Colors.lightBlue,
            ),
          )
        ],
        title: const Center(
          child: Text(
            "EDIT PROFILE",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: UserDetails.headline=='null' || UserDetails.headline==null? hiddenHeadLine:UserDetails.headline,
                  obscureText: false,
                  decoration: const InputDecoration(labelText: "Headline"),
                  onSaved: (input) {
                    headline = input;
                  },
                  validator: (input) => input!.length > 4 && input.isNotEmpty
                      ? null
                      : "Should be at least 4 char ",

                ),
                TextFormField(
                  initialValue: UserDetails.rollNo=='null' || UserDetails.rollNo==null?hiddenRollNo:UserDetails.rollNo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Roll No"),
                  onSaved: (input) {
                    rollNo = input;
                  },
                  validator: (input) => input!.length == 5 && input.isNotEmpty
                      ? null
                      : "Should be 5 char ",
                ),
                const SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Birthdate:  ",
                      style: TextStyle(
                        fontSize: 17,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      UserDetails.birthday==null || UserDetails.birthday=='null'?''
                          : UserDetails.birthday.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime(1995),
                            firstDate: DateTime(1995),
                            lastDate: DateTime.now())
                            .then((value) {
                          setState(() {

                            print('start');
                            _day=value?.day;
                            print(_day);
                            _month=value?.month;
                            print(_month);
                            _year=value?.year;
                            print(_year);
                            dob=(_day.toString()+'/'+_month.toString()+'/'+_year.toString());
                            UserDetails.birthday=dob;
                          });
                        });
                        print(dob);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.blue,
                        ),
                        child: const Text(
                          "Change",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: UserDetails.location=='null' || UserDetails.location==null?hiddenLocation:UserDetails.location,
                  decoration: const InputDecoration(labelText: "Location"),
                  onSaved: (input) {
                    location = input;
                  },
                  validator: (input) => input!.isNotEmpty && input.length > 2
                      ? null
                      : "Should be at least 4 char ",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "\nSport Info :-",
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: TextFormField(
                        initialValue: UserDetails.achivement=='null' || UserDetails.achivement==null?hiddenAchivement:UserDetails.achivement,
                        decoration:
                        const InputDecoration(labelText: "Achivement"),
                        onSaved: (input) {
                          achivement = input;
                        },
                        validator: (input) =>
                        input!.length > 10 && input.isNotEmpty
                            ? null
                            : "Should be at least 10 char ",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: UserDetails.aboutMe=='null' || UserDetails.aboutMe==null?hiddenAboutMe:UserDetails.aboutMe,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  decoration:
                  const InputDecoration(labelText: "About Your self"),
                  onSaved: (input) {
                    aboutUrSelf = input;
                  },
                  validator: (input) => input!.length > 10 && input.isNotEmpty
                      ? null
                      : "Should be at least 10 char ",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "\nContact Url :-",
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.black,
                          size: 37,
                        ),
                        const Text(
                          "   Instagram  ",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: UserDetails.instaUrl=='null'?hiddenInsta:UserDetails.instaUrl,
                            onSaved: (input) {
                              insta = input;
                            },
                            validator: (input) => input!.startsWith(
                                // "https://www.instagram.com/in/") || input.isEmpty
                                "https://www.instagram.com/") || input.isEmpty
                                ? null
                                : "Enter valid URL",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Colors.black,
                          size: 37,
                        ),
                        const Text(
                          "   Twitter  ",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: UserDetails.twitterUrl=='null'?hiddenInsta:UserDetails.twitterUrl,
                            onSaved: (input) {
                              twit = input;
                            },
                            validator: (input) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.black,
                          size: 37,
                        ),
                        const Text(
                          "  Linkedin   ",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: UserDetails.linkedInUrl=='null'?hiddenInsta:UserDetails.linkedInUrl,
                            onSaved: (input) {
                              link = input;
                            },
                            validator: (input) => input!.startsWith(
                                "https://www.linkedin.com/in/") ||
                                input.isEmpty
                                ? null
                                : "Enter valid URL",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const FaIcon(
                          FontAwesomeIcons.phoneAlt,
                          color: Colors.black,
                          size: 37,
                        ),
                        const Text(
                          " WhatsApp's No ",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: UserDetails.whatAppNo=='null'?hiddenInsta:UserDetails.whatAppNo,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (_) {
                              _onSubmit();
                            },
                            onSaved: (input) {
                              mobile = input;
                            },
                            validator: (input) =>
                            input!.length == 10 || input.isEmpty
                                ? null
                                : "Enter valid mobile number",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}