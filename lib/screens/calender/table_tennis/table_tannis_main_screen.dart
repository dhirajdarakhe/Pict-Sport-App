import 'package:flutter/material.dart';
import 'package:psa/screens/calender/table_tennis/table_status_popup.dart';
import 'package:psa/screens/calender/table_tennis/table_tennis_issue_screen.dart';

class TabletannisScreen extends StatefulWidget {
  static const routeName = '/table tennis screen';

  @override
  State<TabletannisScreen> createState() => _TabletannisScreenState();
}

class _TabletannisScreenState extends State<TabletannisScreen> {
  var isRacketIssued = false;
  // const Demo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""
              "Table_Page"),
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
              Expanded(
                flex: 3,
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
                            tableno: 'Table NO 01',
                            unEnrollSeats: 3,
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    // width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/table_tenis_1.jpg"),
                        // fit: BoxFit.fitWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text(
                      "TABLE NO 01",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      // Image.asset("assets/images/table_tenis_1.jpg",fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 3,
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
                            tableno: 'Table NO 02',
                            unEnrollSeats: 4,
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    // width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/table_tenis_2.jpg"),
                        // fit: BoxFit.fitWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text(
                      "TABLE NO 02",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      // Image.asset("assets/images/table_tenis_1.jpg",fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 3,
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
                            tableno: 'Table NO 03',
                            unEnrollSeats: 1,
                          );
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    // width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/table_tenis_1.jpg"),
                        // fit: BoxFit.fitWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text(
                      "TABLE NO 03",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      // Image.asset("assets/images/table_tenis_1.jpg",fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
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
                    elevation: 10.0, shape: StadiumBorder(),
                    child: isRacketIssued
                        ? const Text(
                            'Issue The Racket',
                            style: TextStyle(fontSize: 16),
                          )
                        : const Text(
                            'Issue The Racket',
                            style: const TextStyle(fontSize: 16),
                          ),
                    //makes background color white
                    onPressed: () {
                      setState(() {
                        isRacketIssued = true;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IssueTheRacket();
                      }));
                      print("FlatButton tapped");
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
