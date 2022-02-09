import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/Home/home_screen.dart';
import 'package:psa/screens/intial_page.dart';

import 'UpdateUserInfo.dart';

class GetUserData extends StatelessWidget {
  late String documentId;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    documentId = uid;
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            UserDetails.email=data['email'].toString();
            UserDetails.name=data['name'].toString();
            UserDetails.misId=data['misId'].toString();
            UserDetails.photourl=data['photourl'].toString();
            UserDetails.uid=data['uid'].toString();
            UserDetails.isAdmin=data['isAdmin'];
            UserDetails.sportList=Map<String, bool?>.from(data['SportList']).cast<String, bool>();
            CheckMySportList();
            return const IntialScreen();
          }
          return const Center(child: CircularProgressIndicator(),);
        });
  }
}

