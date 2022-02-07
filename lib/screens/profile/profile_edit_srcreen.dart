import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void _onSubmit() {
    try {
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();
      if(datetime != DateTime.now()) {
        print(datetime); }
        print(location);
        print(link);
        print(twit);
        print(headline);
        print(mobile);
        print(rollNo);
        print(achivement);
        print(mobile);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // to remove back button
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            // setState(() =>
            Navigator.pop(context);
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
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                // ProfileWidget(imagePath: "", onClicked: () async{  },)




                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 12, right: 12, bottom: 19),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 63,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 58,
                                  backgroundImage: NetworkImage(
                                      'https://lh3.googleusercontent.com/a-/AOh14GiI2oRbxg9hBNUSaJE4WVIJMJpRrGHAubWB-BpTzw=s96-c'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              print("Change the profile picture");
                            },
                            child: const Text(
                              "Change the Profile photo",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),







                TextFormField(
                  decoration: const InputDecoration(labelText: "Headline"),
                  onSaved: (input) {
                    headline = input;
                  },
                  validator: (input) => input!.length > 4 || input.length == 0
                      ? null
                      : "Should be at least 4 char ",
                ),
                TextFormField(
                  initialValue: "21118",
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Roll No"),
                  onSaved: (input) {
                    rollNo = input;
                  },
                  validator: (input) => input!.length == 5 || input.length == 0 
                      ? null
                      : "Should be 5 char ",
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 6),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10),
                          child: Text(
                            "Date of Birth",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ),

                        Container(
                          height: 36,
                          width: 280,
                          child: CupertinoDatePicker(
                            initialDateTime: datetime,
                            mode: CupertinoDatePickerMode.date,
                            // maximumYear: 2005,
                            onDateTimeChanged: (datetime) => setState(
                              () {
                                this.datetime = datetime;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Location"),
                  onSaved: (input) {
                    location = input;
                  },
                  validator: (input) => input!.length == 0 || input.length > 2
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
                        decoration:
                            const InputDecoration(labelText: "Achivement"),
                        onSaved: (input) {
                          achivement = input;
                        },
                        validator: (input) =>
                            input!.length > 10 || input.length == 0
                                ? null
                                : "Should be at least 10 char ",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration:
                      const InputDecoration(labelText: "About Your self"),
                  onSaved: (input) {
                    aboutUrSelf = input;
                  },
                  validator: (input) => input!.length > 10 || input.length == 0
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
                            onSaved: (input) {
                              insta = input;
                            },
                            validator: (input) => input!.startsWith(
                                        "https://www.instagram.com/in/") ||
                                    input.length == 0
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
                            onSaved: (input) {
                              link = input;
                            },
                            validator: (input) => input!.startsWith(
                                        "https://www.linkedin.com/in/") ||
                                    input.length == 0
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
                          " Whatsappno ",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (_) {
                              _onSubmit();
                            },
                            onSaved: (input) {
                              mobile = input;
                            },
                            validator: (input) =>
                                input!.length == 10 || input.length == 0
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
