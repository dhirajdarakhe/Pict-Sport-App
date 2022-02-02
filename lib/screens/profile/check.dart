import 'package:flutter/material.dart';
import 'Sports_list.dart';
import 'package:intl/intl.dart';
import 'profile_screen.dart';

DateTime current = DateTime.now();
String now = DateFormat('dd-MM-yyyy ').format(current);

int c = 0;
int b = 0;
int t = 0;
int bd = 0, vb = 0, ch = 0, gym = 0, f = 0;

Color s = Colors.blue;
Color s1 = Colors.blue;
Color s2 = Colors.blue, s3 = Colors.blue, s4 = Colors.blue;
Color s5 = Colors.blue, s6 = Colors.blue, s7 = Colors.blue;

class sports_check extends StatefulWidget {
  const sports_check({Key? key}) : super(key: key);

  @override
  _sports_checkState createState() => _sports_checkState();
}

class _sports_checkState extends State<sports_check> {
  bool bb = false;
  bool cr = false;
  bool tt = false;
  bool bdm = false;
  bool vbl = false;
  bool chs = false;
  bool g = false;
  bool fbbl = false;
  String about_me = '';
  String twitter = '';
  String insta = '';
  String fb = '';
  String snapchat = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: DateTime(1990),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != current)
      setState(() {
        current = pickedDate;
        now = DateFormat('dd-MM-yyyy ').format(current);
      });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                        height: height * 0.070,
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Update Image'),
                ),
                Container(
                  width: width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Describe yourself in few words',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          about_me = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Birthdate: $now',
                      style: TextStyle(fontSize: 18, letterSpacing: 1.8),
                    ),
                    TextButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Roll Number',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          about_me = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Facebook URL',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          fb = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Twitter URL',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          twitter = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Instagram URL',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          insta = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Snapchat URL',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onChanged: (value) {
                          snapchat = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Sports Interested',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (bb == true) {
                          bb = false;
                          del_sport('🏀');
                          s = Colors.blue;
                        } else {
                          bb = true;
                          s = Colors.green;
                          add_sport("🏀");
                        }
                      });
                    },
                    child: Text(
                      'Basketball',
                      style: TextStyle(color: s),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (cr == true) {
                          cr = false;
                          del_sport('🏏');
                          s1 = Colors.blue;
                        } else {
                          cr = true;
                          s1 = Colors.green;
                          add_sport("🏏");
                        }
                      });
                    },
                    child: Text(
                      'Cricket',
                      style: TextStyle(color: s1),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      t++;
                      print(t);
                      if (t % 2 == 0) {
                        tt = false;
                        setState(() {
                          s2 = Colors.blue;
                        });
                      } else {
                        tt = true;
                        setState(() {
                          s2 = Colors.green;
                        });
                      }
                      if (tt == true) {
                        add_sport("🏓");
                      } else {
                        print('del');
                        del_sport('🏓');
                      }
                    },
                    child: Text(
                      'Table Tennis',
                      style: TextStyle(color: s2),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      bd++;

                      if (bd % 2 == 0) {
                        bdm = false;
                        setState(() {
                          s3 = Colors.blue;
                        });
                      } else {
                        bdm = true;
                        setState(() {
                          s3 = Colors.green;
                        });
                      }
                      if (bdm == true) {
                        add_sport("🏸");
                      } else {
                        print('del');
                        del_sport('🎾');
                      }
                    },
                    child: Text(
                      'Badminton',
                      style: TextStyle(color: s3),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      vb++;

                      if (vb % 2 == 0) {
                        vbl = false;
                        setState(() {
                          s4 = Colors.blue;
                        });
                      } else {
                        vbl = true;
                        setState(() {
                          s4 = Colors.green;
                        });
                      }
                      if (vbl == true) {
                        add_sport("🏐");
                      } else {
                        del_sport('🏐');
                      }
                    },
                    child: Text(
                      'Volleyball',
                      style: TextStyle(color: s4),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      ch++;

                      if (ch % 2 == 0) {
                        chs = false;
                        setState(() {
                          s5 = Colors.blue;
                        });
                      } else {
                        chs = true;
                        setState(() {
                          s5 = Colors.green;
                        });
                      }
                      if (chs == true) {
                        add_sport("♟");
                      } else {
                        print('del');
                        del_sport('♟');
                      }
                    },
                    child: Text(
                      'Chess',
                      style: TextStyle(color: s5),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      gym++;

                      if (gym % 2 == 0) {
                        g = false;
                        setState(() {
                          s6 = Colors.blue;
                        });
                      } else {
                        g = true;
                        setState(() {
                          s6 = Colors.green;
                        });
                      }
                      if (g == true) {
                        add_sport("🏋️‍♂️");
                      } else {
                        print('del');
                        del_sport('🏋️‍♂️');
                      }
                    },
                    child: Text(
                      'Gym',
                      style: TextStyle(color: s6),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      f++;

                      if (f % 2 == 0) {
                        fbbl = false;
                        setState(() {
                          s7 = Colors.blue;
                        });
                      } else {
                        fbbl = true;
                        setState(() {
                          s7 = Colors.green;
                        });
                      }
                      if (fbbl == true) {
                        add_sport("⚽");
                      } else {
                        print('del');
                        del_sport('⚽');
                      }
                    },
                    child: Text(
                      'Football',
                      style: TextStyle(color: s7),
                    )),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile_Screen()));
                    },
                    child: Text('Back'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
