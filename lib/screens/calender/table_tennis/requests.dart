import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Table Tennis Requests'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('EquipmentIssuing')
            .doc('TT')
            .collection('Equipment')
            .snapshots(),
        builder: (ctx, equimentSnapshot) {
          if (equimentSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final reqMembers = equimentSnapshot.data!.docs;
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: reqMembers.length,
              itemBuilder: (ctx, index) => reqMembers[index]['isRequested'] == 1
                  ? RequestWidget(
                      isAdmin: UserDetails.isAdmin ?? false,
                      isViewing: false,
                      name: reqMembers[index]['name'],
                      misId: reqMembers[index]['misId'],
                      image: reqMembers[index]['photourl'],
                      tableNumber: reqMembers[index]['tableNumber'],
                      racketNumber: reqMembers[index]['racketNumber'],
                      time: reqMembers[index]['timeOfIsuue'],
                    )
                  : Container());
        },
      ),
    ));
  }
}

class RequestWidget extends StatefulWidget {
  bool isViewing;
  bool isAdmin;
  late String name;
  late String misId;
  late String image;
  late String racketNumber;
  late String tableNumber;
  late Timestamp time;

  RequestWidget(
      {required this.isAdmin,
      required this.isViewing,
      required this.name,
      required this.tableNumber,
      required this.image,
      required this.misId,
      required this.time,
      required this.racketNumber});

  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  var hour, minute, gb = 'pm';
  void cal() {
    hour = widget.time.toDate().hour;
    minute = widget.time.toDate().minute;
    if (hour >= 0 && hour <= 11) {
      gb = 'am';
    }
    if (hour > 12 && hour <= 23) {
      hour = hour - 12;
    } else if (hour == 0) {
      hour = 12;
    }
  }

  Widget onClick() {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return PopUpRequest(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection('EquipmentIssuing')
                        .doc('TT')
                        .collection('Equipment')
                        .doc(UserDetails.uid)
                        .update({
                      'isRequested': 2,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'Request accepted ',
                    )));
                    Navigator.pop(context);
                  },
                  text: 'Want to accept the Request',
                ); //---------
              });
        },
        child: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 50,
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    cal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 15,
        top: 12,
      ),
      child: Container(
        child: Stack(
          children: [
            Padding(
              // top: 2,
              padding: const EdgeInsets.only(top: 11, left: 5),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 3,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    // boxShadow: [

                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 5.0,
                      offset: Offset(4.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[
                     Padding(
                      padding: const EdgeInsets.only(left: 98.0, top: 12,bottom: 17),
                      child: Text(
                        "${widget.name} (Se)",
                        style: const TextStyle(fontSize: 19),
                      ),
                    ),



                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:   <Widget>[

                      const Icon(Icons.menu,size: 27,),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text("Table no            :",style: TextStyle(
                          fontSize: 16
                        ),),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(widget.tableNumber,style: const TextStyle(
                              fontSize: 16
                          ),),
                        )
                    ],),
                  ),



                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,bottom: 15),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children:   <Widget>[
                          const FaIcon(
                            FontAwesomeIcons.tableTennis,
                            size: 26,
                          ),
                          // Icon(Icons.table-tennis,size: 27,),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text("Total Racket      :",style: TextStyle(
                                fontSize: 16
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(widget.racketNumber.toString(),style: const TextStyle(
                                fontSize: 16
                            ),),
                          )
                        ],),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,bottom: 15),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children:   <Widget>[
                          const FaIcon(
                            FontAwesomeIcons.hourglassStart,
                            size: 26,
                          ),
                          // Icon(Icons.table-tennis,size: 27,),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text("Issuing Time :",style: TextStyle(
                                fontSize: 16
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(minute < 10 ? '$hour:0$minute $gb' : '$hour:$minute $gb',style: const TextStyle(
                                fontSize: 16
                            ),),
                          )
                        ],
                      ),
                    ),

              if(true)
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,bottom: 15),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children:  const <Widget>[
                          FaIcon(
                            FontAwesomeIcons.hourglassEnd,
                            size: 26,
                          ),
                          // Icon(Icons.table-tennis,size: 27,),
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text("Returning Time  : ",style: TextStyle(  // <<<<<<<<----------------------
                                fontSize: 16
                            ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text("12",style: TextStyle(                  // <<<<-----------------------
                                fontSize: 16
                            ),),
                          )
                        ],),
                    ),


             if(widget.isAdmin)
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:   <Widget>[
                         RaisedButton(
                              onPressed: () {
                                // Submit(context);
                              },
                              color: Color(0xffc3f7ab),
                              splashColor: Colors.lightBlueAccent,
                              elevation: 10.0,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Text('Accept')),
                              ),
                           RaisedButton(
                              onPressed: () {
                                // Submit(context);
                              },
                              color: Color(0xfff76463),
                              splashColor: Colors.lightBlueAccent,
                              elevation: 10.0,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Text('Reject')),

                          ),

                        ],
                      ),
                    ),




                  ],
                ),
                margin: const EdgeInsets.only(top: 16.0),
              ),
            ),





            // widget.isViewing?Container():widget.isAdmin?onClick():Container(),



            Positioned(
              top: 1,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(widget.image),
                    ),
                  ),
                ),
              ),
            ),


            // widget.isViewing?Container():widget.isAdmin?onClick():Container(),

          ],
        ),
      ),
    );
    // );


    //   Padding(
    //   padding: const EdgeInsets.all(0.0),
    //   child: Container(
    //     width: double.infinity,
    //     height: 250,
    //     decoration: BoxDecoration(
    //       color: Colors.grey[100],
    //       border: Border.all(color: Colors.black, width: 2),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         CircleAvatar(
    //           backgroundImage: NetworkImage(widget.image),
    //           radius: 25,
    //         ),
    //         //const SizedBox(width: 10,),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(
    //                 widget.name,
    //                 style: const TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 8),
    //               child: Text(
    //                 widget.misId,
    //                 style: const TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 8),
    //               child: Row(
    //                 children: [
    //                   /*const Text('Table Number',style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold,
    //                   ),),*/
    //                   Text(
    //                     widget.tableNumber,
    //                     style: const TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 17,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 8),
    //               child: Row(
    //                 children: [
    //                   const Text(
    //                     'Number of Racket :-',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 17,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     width: 5,
    //                   ),
    //                   Text(
    //                     widget.racketNumber.toString(),
    //                     style: const TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 17,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               children: [
    //                 const Text(
    //                   'Issuing Time',
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 17,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 8,
    //                 ),
    //                 Text(
    //                   minute < 10 ? '$hour:0$minute $gb' : '$hour:$minute $gb',
    //                   style: const TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //         widget.isViewing?Container():widget.isAdmin?onClick():Container(),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class PopUpRequest extends StatelessWidget {
  late VoidCallback onTap;
  late String text;
  PopUpRequest({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Icons.check_circle,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Icon(Icons.cancel, size: 40, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IssuedTableRacket extends StatelessWidget {
   IssuedTableRacket({Key? key, required this.value, required this.title}) : super(key: key);
  String? title;
  String? value;

  @override
  Widget build(BuildContext context) {
    return                Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:   <Widget>[

          const Icon(Icons.menu,size: 27,),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text("${title!} : ",style: const TextStyle(
                fontSize: 16
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(value!,style: const TextStyle(
                fontSize: 16
            ),),
          )
        ],),
    );
  }
}
