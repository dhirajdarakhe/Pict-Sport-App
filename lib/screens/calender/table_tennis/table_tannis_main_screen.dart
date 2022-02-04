import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/calender/table_tennis/requests.dart';
import 'package:psa/screens/calender/table_tennis/table_status_popup.dart';
import 'package:psa/screens/calender/table_tennis/table_tennis_issue_screen.dart';

class TabletannisScreen extends StatefulWidget {
  static const routeName = '/table tennis screen';

  @override
  State<TabletannisScreen> createState() => _TabletannisScreenState();
}

class _TabletannisScreenState extends State<TabletannisScreen> {

  late bool _isRequested=true;
  bool _isFirstVisit=false;

  Future getStatus()async{
    var v=await FirebaseFirestore.instance.collection('EquipmentIssuing')
        .doc('TT').collection('Equipment')
        .doc(UserDetails.uid).get();

    if (v.exists){
      _isRequested=v.get('isRequested');
      setState(() {
        _isFirstVisit=false;
      });
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
  @override
  void initState() {
    // TODO: implement initState
    getStatus();
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
                icon: const Icon(Icons.request_page_outlined,size: 30,))
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              TTWidget(tableNumber: '01',enrolledSeats: 3,image: "assets/table_tenis_1.jpg",),
              const SizedBox(
                height: 15,
              ),
              TTWidget(image: "assets/table_tenis_2.jpg", enrolledSeats: 2, tableNumber: '02'),
              const SizedBox(
                height: 15,
              ),
              TTWidget(image: "assets/table_tenis_1.jpg",enrolledSeats: 2,tableNumber: '03',),
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
                          ):_isRequested? const Text(
                            'Requested',
                            style: TextStyle(fontSize: 16),
                          ):const Text(
                      'Return the Racket',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IssueTheRacket();
                      }));*/

                    },
                  ),
                ),
              )
            ],
          ),
        ));
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
