import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/intial_page.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _basketball=false,_cricket=false,_football=false,_badminton=false,
  _volleyball=false,_chess=false,_gym=false,_tabletennis=false;
  String misId='';

  Widget onClick(bool onp){
    return onp?const Icon(Icons.check_circle,
      color: Colors.green,size: 30,
    ):const Icon(Icons.cancel,color: Colors.red,size: 30,);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          title: const Text(
            'UserInfo Screen',
            style: TextStyle(color: Colors.red),
          ),
        ),*/
        body: Container(
          height: height ,
          width: width ,
          color: const Color(0xFFE3F2FD),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const Text('Please Complete The',style: TextStyle(
                  color: Color(0xFF283593),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                const Text('SignUp Process',style: TextStyle(
                  color: Color(0xFF283593),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text('MIS-ID',style: TextStyle(color: Color(0xFF0D47A1),
                          fontSize: 17),),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.length <23) {
                            return "MIS ID cannot be too short";
                          }else if (val.length>23){
                            return "MIS ID cannot be that long";
                          }
                          return null;
                        },
                        //obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFF1A237E))),
                        ),
                        onChanged: (value) {
                          misId = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 16,
                      sigmaX: 16,
                    ),
                    child: Container(
                      child: Column(
                        children: [
                         const Text('Select the Sports ',style: TextStyle(
                            color: Color(0xFFFF9800),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),),
                         const Text('You are Intersected in ',style: TextStyle(
                            color: Color(0xFFFF9800),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               const Text('BasketBall',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_basketball==true) {
                                        _basketball=false;
                                      } else {
                                        _basketball=true;
                                      }
                                    });
                                  },
                                  child: onClick(_basketball),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Table Tennis',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_tabletennis==true) {
                                        _tabletennis=false;
                                      } else {
                                        _tabletennis=true;
                                      }
                                    });
                                  },
                                  child: onClick(_tabletennis),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Cricket',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_cricket==true) {
                                        _cricket=false;
                                      } else {
                                        _cricket=true;
                                      }
                                    });
                                  },
                                  child: onClick(_cricket),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Badminton',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_badminton==true) {
                                        _badminton=false;
                                      } else {
                                        _badminton=true;
                                      }
                                    });
                                  },
                                  child: onClick(_badminton),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('VolleyBall',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_volleyball==true) {
                                        _volleyball=false;
                                      } else {
                                        _volleyball=true;
                                      }
                                    });
                                  },
                                  child: onClick(_volleyball),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Chess',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_chess==true) {
                                        _chess=false;
                                      } else {
                                        _chess=true;
                                      }
                                    });
                                  },
                                  child: onClick(_chess),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Gym',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_gym==true) {
                                        _gym=false;
                                      } else {
                                        _gym=true;
                                      }
                                    });
                                  },
                                  child: onClick(_gym),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Football',style: TextStyle(
                                  color: Color(0xFFAFB42B),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (_football==true) {
                                        _football=false;
                                      } else {
                                        _football=true;
                                      }
                                    });
                                  },
                                  child: onClick(_football),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      if (misId.length<23){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('MIS ID cannot be that small')));
                      }else if (misId.length>23){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('MIS ID cannot be that long')));
                      }else{
                        //print(UserDetails.sportList?.update(key, (value) => false));
                        if (_basketball){
                          UserDetails.sportList?.update('BasketBall', (value) => true);
                        }
                        if (_football){
                          UserDetails.sportList?.update('FootBall', (value) => true);
                        }
                        if (_volleyball){
                          UserDetails.sportList?.update('VolleyBall', (value) => true);
                        }
                        if (_cricket){
                          UserDetails.sportList?.update('Cricket', (value) => true);
                        }
                        if (_chess){
                          UserDetails.sportList?.update('Chess', (value) => true);
                        }
                        if (_gym){
                          UserDetails.sportList?.update('Gym', (value) => true);
                        }
                        if (_tabletennis){
                          UserDetails.sportList?.update('TableTennis', (value) => true);
                        }
                        if (_badminton){
                          UserDetails.sportList?.update('Badminton', (value) => true);
                        }
                        UserDetails.misId=misId;
                        FirebaseFirestore.instance
                        .collection('User')
                        .doc(UserDetails.uid)
                        .update({
                          'misId':misId,
                          'SportList': UserDetails.sportList,
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                         return IntialScreen();
                        }));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('SUBMIT',style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
