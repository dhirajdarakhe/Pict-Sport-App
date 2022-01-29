import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  var keyies;
  NewMessage({required this.keyies});
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user=FirebaseAuth.instance.currentUser;
    final userData=await FirebaseFirestore.
    instance.
    collection('User').
    doc(user?.uid).get();

    FirebaseFirestore.instance.collection('SportsGroup').doc(widget.keyies.toString())
        .collection('Chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user?.uid,
      'username': userData['name'],
      'userImage':userData['photourl'],
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                /*labelStyle: TextStyle(
                  color: Colors.white,
                ),*/
                labelText: 'Send a message...',),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.send,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          )
        ],
      ),
    );
  }
}
