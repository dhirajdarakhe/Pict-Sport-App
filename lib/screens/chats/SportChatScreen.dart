import 'package:flutter/material.dart';
import 'messages.dart';
import 'newMessage.dart';

class SportChatScreen extends StatefulWidget {
  const SportChatScreen({Key? key}) : super(key: key);
  static const routeName = '/sport_chat';

  @override
  _SportChatScreenState createState() => _SportChatScreenState();
}

class _SportChatScreenState extends State<SportChatScreen> {
  bool _isInit=true;
  var _productId,_key;
  @override
  void didChangeDependencies(){
   if (_isInit){
     _productId = ModalRoute.of(context)!.settings.arguments as String;
     if (_productId=='BasketBall'){
       _key='BB';
     }else if (_productId=='VolleyBall'){
       _key='FF';
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
    return Scaffold(
      //backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(_productId.toString(),style: const TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: Container(
        child: Column(
          children: [
           Expanded(child: Messages(_key)),
            NewMessage(keyies: _key,),
          ],
        ),
      ),
    );
  }
}
