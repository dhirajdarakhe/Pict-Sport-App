import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/screens/otherUserDetails/userprofilescreen.dart';


class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'App Users',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('User').snapshots(),

        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final usersnap = userSnapshot.data!.docs;
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: usersnap.length,
              itemBuilder: (ctx, index) => UserWidget(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OtherUserProfileScreeen(
                        uid: usersnap[index]['uid'],
                      );
                    }));
                  },
                  misId: usersnap[index]['misId'],
                  name: usersnap[index]['name'],
                  url: usersnap[index]['photourl']));
        },
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  late String name, misId, url;
  VoidCallback onTap;
  UserWidget(
      {required this.onTap,
      required this.misId,
      required this.name,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              // CircleAvatar(
              //   backgroundImage: NetworkImage(url.toString()),
              //   radius: 25,
              // ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(url.toString()),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    misId.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
