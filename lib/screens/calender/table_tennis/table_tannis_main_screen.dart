import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/calender/table_tennis/playing.dart';
import 'package:psa/screens/calender/table_tennis/requests.dart';
import 'package:psa/screens/calender/table_tennis/return.dart';
import 'package:psa/screens/calender/table_tennis/table_status_popup.dart';
import 'package:psa/screens/calender/table_tennis/table_tennis_issue_screen.dart';

class TabletannisScreen extends StatefulWidget {
  @override
  State<TabletannisScreen> createState() => _TabletannisScreenState();
}

class _TabletannisScreenState extends State<TabletannisScreen> {

  late int _isRequested=0;
  bool _isFirstVisit=false;
  var _table,_noOfRacket;
  int racket1=0,racket2=0,racket3=0;

  Future getStatus(BuildContext context)async{
    var v =await FirebaseFirestore.instance.collection('EquipmentIssuing')
        .doc('TT').collection('Equipment')
        .doc(UserDetails.uid).get();
    if (v.exists){
      _isRequested=v.get('isRequested');
      _table=v.get('tableNumber');
      _noOfRacket=v.get('racketNumber');
      if (_isRequested==3){
        setState(() {
          _isFirstVisit=true;
        });
      }else{
        setState(() {
          _isFirstVisit=false;
        });
      }
      print('RRR');
      }
    else{
      print('FFFF');
     // _isRequested=false;
      setState(() {
        _isFirstVisit=true;
      });
    }
  }

  void CaluSeat()
  {

  }

  @override
  void initState() {
    // TODO: implement initState
    getStatus(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""
              "Table Tennis",),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Request();
              }));
            },
                icon: const Icon(Icons.request_page_outlined,size: 30,)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Playing();
              }));
            },
                icon: const Icon(Icons.change_history_outlined,size: 30,)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ReturnScreen();
              }));
            },
                icon: const Icon(Icons.read_more_outlined,size: 30,)),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.
          collection('EquipmentIssuing')
              .doc('TT').collection('Equipment').
          snapshots(),
          builder:(ctx, userSnapshot){
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //getStatus(context);
            final usersnap = userSnapshot.data!.docs;
            racket1=0;racket3=0;racket2=0;
            print('start');
            for(int i=0;i<usersnap.length;i++){
              if (usersnap[i]['tableNumber']=='Table 1'){
                print('racket 1');
                if (usersnap[i]['isReturn']==false){
                  racket1+=int.parse(usersnap[i]['racketNumber']);
                }else{
                  racket1-=int.parse(usersnap[i]['racketNumber']);
                }
                print(racket1);
              }else if (usersnap[i]['tableNumber']=='Table 2'){
                print('racket 2 initial');
                print(racket2);
                if (usersnap[i]['isReturn']==false){
                  racket2+=int.parse(usersnap[i]['racketNumber']);
                }else{
                  racket2-=int.parse(usersnap[i]['racketNumber']);
                }
                print('racket 2 after');
                print(racket2);
              }else if (usersnap[i]['tableNumber']=='Table 3'){
                print('racket 3 inital');
                print(racket3);
                if (usersnap[i]['isReturn']==false){
                  racket3+=int.parse(usersnap[i]['racketNumber']);
                }else{
                  racket3-=int.parse(usersnap[i]['racketNumber']);
                }
                print('racket 3 after');
                print(racket3);
              }
            }
            if (racket1<0){racket1=0;}
            if (racket2<0){racket2=0;}
            if (racket3<0){racket3=0;}
            print(racket1);
            print(racket2);
            print(racket3);
            print('end');
            return  Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  TTWidget(tableNumber: '01',
                    enrolledSeats: racket1,
                    image: "assets/table_tenis_1.jpg",),
                  const SizedBox(
                    height: 15,
                  ),
                  TTWidget(image: "assets/table_tenis_2.jpg",
                      enrolledSeats: racket2, tableNumber: '02'),
                  const SizedBox(
                    height: 15,
                  ),
                  TTWidget(image: "assets/table_tenis_1.jpg",
                    enrolledSeats: racket3,tableNumber: '03',),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 200,
                      // margin: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        splashColor: Colors.lightBlueAccent,
                        elevation: 10.0, shape: const StadiumBorder(),
                        child:_isFirstVisit? const Text(
                          'Issue the Racked',
                          style: TextStyle(fontSize: 16),
                        ):_isRequested==1? const Text(
                          'Requested',
                          style: TextStyle(fontSize: 16),
                        ):_isRequested==2? const Text(
                          'Return the Racket',
                          style: TextStyle(fontSize: 16),
                        ):_isRequested==4?const Text(
                          'Issue the Racked',
                          style: TextStyle(fontSize: 16),
                        ): Container(),
                        onPressed: () {
                          _isFirstVisit?Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return IssueTheRacket();
                              })):_isRequested==1? showDialog(
                              context: context,
                              builder: (context) {
                                return PopUpRequest(onTap: (){
                                  FirebaseFirestore.instance.collection('EquipmentIssuing')
                                      .doc('TT').collection('Equipment')
                                      .doc(UserDetails.uid).update({
                                    'isRequested':3,
                                  });
                                  setState(() {
                                    _isFirstVisit=true;
                                  });
                                  Navigator.pop(context);
                                },
                                    text: 'Want to cancel the request');
                                //---------
                              }):_isRequested==2? showDialog(context: context,
                              builder: (context){
                                return ReturnPopUpWidget(
                                    noOfRacket: _noOfRacket,
                                    table: _table,
                                    onTap: (){
                                      FirebaseFirestore.instance.collection('EquipmentIssuing')
                                          .doc('TT').collection('Equipment')
                                          .doc(UserDetails.uid).update({
                                        'isRequested':4,
                                        'isReturn':true,
                                      });
                                      setState(() {
                                        _isFirstVisit=true;
                                      });
                                      Navigator.pop(context);
                                    });
                              }):Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return IssueTheRacket();
                              }));
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ));
  }
}

class ReturnPopUpWidget extends StatelessWidget {
  late String table;
  late String noOfRacket;
  VoidCallback onTap;
  ReturnPopUpWidget({required this.noOfRacket,
    required this.table,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(table,style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No of Racket ',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  const SizedBox(width: 10,),
                  Text(noOfRacket,style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Icons.check_circle,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                  const Icon(Icons.cancel, size: 40, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class TTWidget extends StatelessWidget {
  late String tableNumber;
  late String image;
  late int enrolledSeats;
  TTWidget({required this.image,
    required this.enrolledSeats,required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
                backgroundColor: Colors.lightBlueAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        // bottomRight: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(56.0))),
                context: context,
                builder: (context) {
                  return TableStatusPopup(
                    tableno: 'Table NO $tableNumber',
                    unEnrollSeats: enrolledSeats,
                  );
                });
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            // width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black,width: 5),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              "TABLE NO $tableNumber",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
