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
      //color: Colors.green,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              //focusNode: widget.focusNode,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              keyboardType: TextInputType.multiline,
              maxLines:2,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 0.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                labelText: 'Send a message...',),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          const SizedBox(width: 20,),
          GestureDetector(
            onTap: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            child:  Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
