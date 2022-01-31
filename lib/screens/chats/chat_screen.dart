import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/chats/SportChatScreen.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 80,),
        Expanded(
          child: ListView.builder(
            itemCount: UserDetails.mySportsList!.length,
              itemBuilder: (ctx, index) => SportGrpNameWidget(
                lastMsg: '3:22 PM   ',
                onTap: (){
                  Navigator.of(context)
                      .pushNamed(SportChatScreen.routeName,
                    arguments: UserDetails.mySportsList![index],);
                },
                name: UserDetails.mySportsList![index],
                imag: UserDetails.mySportEmoji![index],
              )),
        ),
      ],
    );
  }
}

class SportGrpNameWidget extends StatelessWidget {
  late String name,imag,lastMsg;
  VoidCallback onTap;
  SportGrpNameWidget({required this.lastMsg,required this.onTap,required this.name,required this.imag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imag,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(name,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(lastMsg,style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF5F5F5),
          ),
        ),
      ),
    );
  }
}
