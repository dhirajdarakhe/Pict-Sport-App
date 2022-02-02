import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/drawer/users.dart';

class ChatMembers extends StatefulWidget {
  static const routeName = '/chat_members';
  const ChatMembers({Key? key}) : super(key: key);

  @override
  _ChatMembersState createState() => _ChatMembersState();
}

class _ChatMembersState extends State<ChatMembers> {
  var _productId, _key;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _productId = ModalRoute.of(context)!.settings.arguments as String;
      if (_productId == 'BasketBall') {
        _key = 'BB';
      } else if (_productId == 'VolleyBall') {
        _key = 'VB';
      } else if (_productId == 'TableTennis') {
        _key = 'TT';
      } else if (_productId == 'Badminton') {
        _key = 'BT';
      } else if (_productId == 'Cricket') {
        _key = 'CR';
      } else if (_productId == 'FootBall') {
        _key = 'FB';
      } else if (_productId == 'Chess') {
        _key = 'CH';
      } else if (_productId == 'Gym') {
        _key = 'GY';
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('User').snapshots(),
            builder: (ctx, grpMemSnapshot) {
              if (grpMemSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final grpMembers = grpMemSnapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: height * 0.11,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10,bottom: 5),
                            child: Text(
                              _productId,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Group Members',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemCount: grpMembers.length,
                        itemBuilder: (ctx, index) => grpMembers[index]
                                ['SportList'][_productId]
                            ? UserWidget(
                                onTap: () {},
                                misId: grpMembers[index]['misId'],
                                name: grpMembers[index]['name'],
                                url: grpMembers[index]['photourl'])
                            : Container()),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
