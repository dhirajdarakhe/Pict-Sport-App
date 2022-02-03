import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String? isViewer;

class OtherUserProfile extends StatelessWidget {
  late String email;
  late String misId;
  late String name;
  late String photourl;
  late Map sportList={};
  List selectedSports=[];

  Future getDetails()async{
    var d=await FirebaseFirestore.instance
        .collection('User')
        .doc(isViewer).get();
    email=d.data()!['email'];
    misId=d.data()!['misId'];
    name=d.data()!['name'];
    sportList=d.data()!['SportList'];
    photourl=d.data()!['photourl'];
    print('hey');
    selectedSports.clear();
    for(var e in sportList.entries){
      if (e.value==true){
        selectedSports.add(e.key);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
          future: getDetails(),
      builder:(ctx,i){
    if (i.connectionState == ConnectionState.done) {
      if (i.hasData){
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(photourl),
                          backgroundColor: Colors.blue,
                          radius: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(name,style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(email,style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(misId,style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Sports Intrested',style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),),
                        ),
                      ],
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: selectedSports.length,
                      itemBuilder: (ctx,index){
                        getDetails();
                        return TempText(name: selectedSports[index]);
                      }),
                )
              ],
            ),
          ),
        );
      }
    }
    return const Center(child: CircularProgressIndicator(),);
      },
    ));
  }
}

class TempText extends StatelessWidget {
  late String name;
  TempText({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          name,style: const TextStyle(
          color: Colors.yellow,
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}

