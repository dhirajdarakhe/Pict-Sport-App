import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:psa/models/userDetails.dart';

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
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: Row(
        mainAxisAlignment:
        widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.isMe?Container():CircleAvatar(
            backgroundImage: NetworkImage(widget.userImage),
          ),
          Bubble(
            stick: true,
            nip: widget.isMe? BubbleNip.rightTop:BubbleNip.leftTop,
            margin: const BubbleEdges.only(top: 15,left: 6,right: 6),
            color: widget.isMe ? Colors.grey[300] : Colors.orangeAccent,
            child: Container(
              width: widget.message.length<width-350? null:width-130,
              decoration: BoxDecoration(
               // color: widget.isMe ? Colors.grey[300] : Colors.orangeAccent,
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
              child: Column(
                crossAxisAlignment:widget.isMe? CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment:
                    widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     widget.isMe?Container(): Text(
                        widget.username,
                        //textAlign: widget.isMe?TextAlign.start:TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.isMe ? Colors.blue : Colors.brown.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        widget.message,
                        textAlign: widget.isMe ? TextAlign.start : TextAlign.start,
                        style: TextStyle(
                          color: widget.isMe ? Colors.blue : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    minute<10?'$hour:0$minute $gb':
                    '$hour:$minute $gb',
                    //textAlign: widget.isMe?TextAlign.end:TextAlign.end,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          widget.isMe?CircleAvatar(
            backgroundImage: NetworkImage(UserDetails.photourl.toString()),
          ):Container(),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  MessageTile({required this.message, required this.isSendByMe});
  final message;
  final bool isSendByMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: isSendByMe ? 0 : 24, right: isSendByMe ? 24 : 0),
      margin: EdgeInsets.symmetric(vertical: 8),
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      width: MediaQuery.of(context).size.height,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
          decoration: BoxDecoration(
              borderRadius: isSendByMe
                  ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23),
              )
                  : BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
              gradient:
              isSendByMe ?  LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple, Colors.purple]) :
              LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.lightGreen, Colors.lightGreen])
            // LinearGradient(
            //     colors: isSendByMe ? [Colors.red] [Colors.red] : [Colors.blue][Colors.blue])
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          )),
    );
  }
}