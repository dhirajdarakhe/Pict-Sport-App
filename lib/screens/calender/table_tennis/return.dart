import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/calender/table_tennis/widget.dart';

class ReturnScreen extends StatelessWidget {
  const ReturnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Rackets Returned'),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('TTEquipment')
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
                  itemBuilder: (ctx, index) => reqMembers[index]['isReturn']
                      ? RequestWidget(
                    returnTime: reqMembers[index]['timeOfReturn'],
                    requestScreen: false,
                    isAdmin: false,
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
