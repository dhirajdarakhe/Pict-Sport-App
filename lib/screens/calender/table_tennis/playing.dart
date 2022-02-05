import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/calender/table_tennis/requests.dart';


//Aceppted request

class Playing extends StatelessWidget {
  const Playing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Rackets Issued'),
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
                  itemBuilder: (ctx, index) => reqMembers[index]['isRequested'] == 2
                      ? RequestWidget(
                    isViewing: true,
                    name: reqMembers[index]['name'],
                    misId: reqMembers[index]['misId'],
                    image: reqMembers[index]['photourl'],
                    tableNumber: reqMembers[index]['tableNumber'],
                    racketNumber: reqMembers[index]['racketNumber'],
                    time: reqMembers[index]['timeOfIsuue'], isAdmin: false,
                  )
                      : Container());
            },
          ),
        ));
  }
}
