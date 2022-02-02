import 'package:flutter/material.dart';
import 'package:psa/screens/chats/chat_members.dart';
import 'messages.dart';
import 'newMessage.dart';
import 'package:swipe_to/swipe_to.dart';

class SportChatScreen extends StatefulWidget {
  const SportChatScreen({Key? key}) : super(key: key);
  static const routeName = '/sport_chat';

  @override
  _SportChatScreenState createState() => _SportChatScreenState();
}

class _SportChatScreenState extends State<SportChatScreen> {
  bool _isInit=true;
  final focusNode=FocusNode();
  Messages? replyMessage;
  var _productId,_key;

  void replyToMessage(Messages message) {
    setState(() {
      replyMessage=message;
    });
  }
  @override
  void didChangeDependencies(){
   if (_isInit){
     _productId = ModalRoute.of(context)!.settings.arguments as String;
     if (_productId=='BasketBall'){
       _key='BB';
     }else if (_productId=='VolleyBall'){
       _key='VB';
     }else if (_productId=='TableTennis'){
       _key='TT';
     }else if (_productId=='Badminton'){
       _key='BT';
     }else if (_productId=='Cricket'){
       _key='CR';
     }else if (_productId=='FootBall'){
       _key='FB';
     }else if (_productId=='Chess'){
       _key='CH';
     }else if (_productId=='Gym'){
       _key='GY';
     }
   }
   _isInit=false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            Expanded(child: Center(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                              child: const Icon(Icons.arrow_back,
                                size: 30,color: Colors.white,)),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                            _productId.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(ChatMembers.routeName,arguments: _productId);
                          },
                          child: const Icon(Icons.group_add_outlined,
                            size: 30,color: Colors.white,)),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 9,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                   Expanded(child: Messages(uniqueValue: _key,)),
                    NewMessage(keyies: _key,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
