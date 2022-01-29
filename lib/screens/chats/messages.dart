import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'messageBubble.dart';

class Messages extends StatelessWidget {

  var _uniqueValue;
  Messages(this._uniqueValue);
  @override
  Widget build(BuildContext context) {
    User? user= FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('SportsGroup')
        .doc(_uniqueValue.toString())
        .collection('Chat')
            .orderBy(
          'createdAt',
          descending: true,
        )
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = chatSnapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) => MessageBubble(
              chatDocs[index]['text'],
              chatDocs[index]['createdAt'],
              chatDocs[index]['userId'] == user?.uid,
              chatDocs[index]['username'],
              chatDocs[index]['userImage'],
              key: ValueKey(chatDocs[index].id),
            ),
          );
        });
  }
}
