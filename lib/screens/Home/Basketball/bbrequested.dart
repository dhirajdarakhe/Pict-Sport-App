import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/Home/table_tennis/popUpWidget.dart';
import 'package:psa/screens/Home/table_tennis/widget.dart';

class Requested extends StatefulWidget {
  const Requested({Key? key}) : super(key: key);

  @override
  _RequestedState createState() => _RequestedState();
}

class _RequestedState extends State<Requested> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BasketBall Requests'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('BBEquipment')
            .snapshots(),
        builder: (ctx, equimentSnapshot){
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
                returnTime: reqMembers[index]['timeOfReturn'],
                requestScreen: true,
                isAdmin: UserDetails.isAdmin ?? false,
                isViewing: false,
                name: reqMembers[index]['name'],
                misId: reqMembers[index]['misId'],
                image: reqMembers[index]['photourl'],
                tableNumber: reqMembers[index]['tableNumber'],
                racketNumber: reqMembers[index]['racketNumber'],
                time: reqMembers[index]['timeOfIsuue'],
                uid: reqMembers[index]['uid'],
              )
                  : Container());
        },
      ),
    ));
  }
}

class BBRequest extends StatefulWidget {
  late String name;
  late String ballNumber;
  late String noOfBall;
  late Timestamp timeOfIssue;
  late Timestamp timeOfReturn;
  late bool isAdmin;
  late bool requestScreen;
  late String uid;

  BBRequest({required this.uid,
    required this.requestScreen
    ,required this.timeOfReturn,
  required this.timeOfIssue,
  required this.noOfBall,
  required this.name,
  required this.isAdmin,
  required this.ballNumber});

  @override
  _BBRequestState createState() => _BBRequestState();
}

class _BBRequestState extends State<BBRequest> {
  var hour, minute, gb = 'pm';
  var rHour,rMinute,rGb='pm';
  void cal() {
    hour = widget.timeOfIssue.toDate().hour;
    minute = widget.timeOfIssue.toDate().minute;
    rHour=widget.timeOfReturn.toDate().hour;
    rMinute=widget.timeOfReturn.toDate().minute;
    if (hour >= 0 && hour <= 11) {
      gb = 'am';
    }
    if (rHour >= 0 && rHour <= 11) {
      rGb = 'am';
    }
    if (hour > 12 && hour <= 23) {
      hour = hour - 12;
    } else if (hour == 0) {
      hour = 12;
    }
    if (rHour > 12 && rHour <= 23) {
      rHour = rHour - 12;
    } else if (rHour == 0) {
      rHour = 12;
    }
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
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 98.0, top: 12, bottom: 17),
                      child: Text(
                        widget.name,
                        style: const TextStyle(fontSize: 19),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.menu,
                            size: 27,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              "Ball Size            :",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              widget.ballNumber,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                      child: Row(
                        children: <Widget>[
                          const FaIcon(
                            FontAwesomeIcons.tableTennis,
                            size: 26,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              "Total Balls      :",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              widget.noOfBall.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                      child: Row(
                        children: <Widget>[
                          const FaIcon(
                            FontAwesomeIcons.hourglassStart,
                            size: 26,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              "Issuing Time :",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              minute < 10
                                  ? '$hour:0$minute $gb'
                                  : '$hour:$minute $gb',
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (!widget.requestScreen)
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                        child: Row(
                          children: <Widget>[
                            const FaIcon(
                              FontAwesomeIcons.hourglassEnd,
                              size: 26,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Text(
                                "Returning Time  : ",
                                style: TextStyle(
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                rMinute < 10
                                    ? '$rHour:0$rMinute $rGb'
                                    : '$rHour:$rMinute $rGb',
                                style: const TextStyle(
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    if (widget.isAdmin)
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                // Submit(context);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PopUpRequest(
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .collection('BBEquipment')
                                              .doc(widget.uid)
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
                              color: const Color(0xffc3f7ab),
                              splashColor: Colors.lightBlueAccent,
                              elevation: 10.0,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text('Accept')),
                            ),
                            RaisedButton(
                              onPressed: () {
                                // Submit(context);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PopUpRequest(
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .collection('BBEquipment')
                                              .doc(widget.uid)
                                              .update({
                                            'isRequested': 5,
                                          });
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text(
                                                'Request rejected',
                                              )));
                                          Navigator.pop(context);
                                        },
                                        text: 'Want to Reject the Request?',
                                      ); //---------
                                    });
                              },
                              color: const Color(0xfff76463),
                              splashColor: Colors.lightBlueAccent,
                              elevation: 10.0,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
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
  }
}
