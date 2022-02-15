import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/Home/table_tennis/table_tennis_issue_screen.dart';

class SevenNo extends StatefulWidget {
  const SevenNo({Key? key}) : super(key: key);

  @override
  _SevenNoState createState() => _SevenNoState();
}

class _SevenNoState extends State<SevenNo> {
  final formatYMDHM = DateFormat("yyyy-MM-dd HH:mm");
  DateTime? eventDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();


  String? choosedBall;
  void _selected_Ball(String ball) => choosedBall = ball;

  Future _submit()async{
    await FirebaseFirestore.instance
        .collection('BBEquipment')
        .doc(UserDetails.uid).set({
      'size':7,
      'timeOfIssue':Timestamp.now(),
      'timeOfReturn':Timestamp.now(),
      'isRequested':1,
      'isReturn':false,
      'noOfBall':choosedBall,
      'name':UserDetails.name,
      'misId':UserDetails.misId,
      'photourl':UserDetails.photourl,
      'uid':UserDetails.uid,
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    double hei=MediaQuery.of(context).size.height;
    double wei=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: hei*0.5,
                width: wei*0.9,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Ball Size',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                        Text('7',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Number of Balls',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                        DropDown(
                            ItemList: const ['1', '2', '3', '4'],
                            item1: 'Ball',
                            submitFn: _selected_Ball),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Time Of Issuement', style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: DateTimeField(
                              initialValue: DateTime.now(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              enabled: true,
                              enableInteractiveSelection: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.date_range_outlined,color: Colors.white,size: 35,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white,width: 2),
                                ),
                              ),
                              format: formatYMDHM,
                              onShowPicker: (context, currentValue) async {
                                final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (date != null) {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now(),
                                    ),
                                  );
                                  eventDate =DateTimeField.combine(date, time);
                                  return DateTimeField.combine(date, time);
                                } else {
                                  eventDate = currentValue;
                                  return currentValue;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                _submit();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Submit',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
