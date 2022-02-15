import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/Home/table_tennis/widget.dart';
//Aceppted request

class Playing extends StatelessWidget {
  const Playing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Rackets Issued'),
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
                  itemBuilder: (ctx, index) => reqMembers[index]['isRequested'] == 2
                      ? RequestWidget(
                    uid: reqMembers[index]['uid'],
                    returnTime: reqMembers[index]['timeOfReturn'],
                    requestScreen: true,
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
