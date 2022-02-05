import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';

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
                isAdmin: UserDetails.isAdmin??false,
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
      required this.racketNumber}
      );

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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
              radius: 25,
            ),
            //const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.misId,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      /*const Text('Table Number',style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),*/
                      Text(
                        widget.tableNumber,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Text(
                        'Number of Racket :-',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.racketNumber.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Issuing Time',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      minute < 10 ? '$hour:0$minute $gb' : '$hour:$minute $gb',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            widget.isViewing?Container():widget.isAdmin?onClick():Container(),
          ],
        ),
      ),
    );
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
