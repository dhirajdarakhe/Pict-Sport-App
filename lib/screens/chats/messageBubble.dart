import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget {
  MessageBubble(this.message, this.time,this.isMe, this.username, this.userImage,
      {required this.key});
  final String username;
  final Key key;
  final Timestamp time;
  final String message;
  final bool isMe;
  final String userImage;


  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {

  var hour,minute,gb='pm';
  void cal()
  {
    hour=widget.time.toDate().hour;
    minute=widget.time.toDate().minute;
    if (hour>=0 && hour<=11){
      gb='am';
    }
    if (hour>12 && hour<=23){
      hour=hour-12;
    }else if (hour==0){
      hour=12;
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
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: widget.isMe ? Colors.grey[300] : Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !widget.isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: widget.isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.isMe ? Colors.blue : Colors.white,
                    ),
                  ),
                  Text(
                    widget.message,
                    textAlign: widget.isMe ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      color: widget.isMe ? Colors.blue : Colors.white,
                    ),
                  ),
                  Text(
                    '$hour:$minute $gb',
                    //'hour+':'+minute+'_'+gb',
                    textAlign: widget.isMe ? TextAlign.start : TextAlign.end,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: widget.isMe ? null : 120,
          right: widget.isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              widget.userImage,
            ),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
