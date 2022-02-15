import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/Home/table_tennis/table_tannis_main_screen.dart';

//bool requested=false;

class IssueTheRacket extends StatefulWidget {
  const IssueTheRacket({Key? key}) : super(key: key);

  @override
  State<IssueTheRacket> createState() => _IssueTheRacketState();
}

class _IssueTheRacketState extends State<IssueTheRacket> {

  final _name = UserDetails.name;
  String? choosedTable;
  String? choosedRacket;

  void _selected_table(String table) => choosedTable = table;
  void _selected_Racket(String racket) => choosedRacket = racket;

  DateTime? eventDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final formatYMDHM = DateFormat("yyyy-MM-dd HH:mm");
  
  Future Submit(BuildContext context)async{
    if (choosedTable==null && choosedRacket==null){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          'Please enter the Table Number and Number of Racket you want to issue',style: TextStyle(
          color: Colors.red,
          fontSize: 15,
        ),
        ),
      ));
    } else if (choosedTable==null){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          'Please enter the Table Number',style: TextStyle(
          color: Colors.red,
          fontSize: 15,
        ),
        ),
      ));
    } else if (choosedRacket==null){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          'Please enter the Number of Racket you want to issue',style: TextStyle(
          color: Colors.red,
          fontSize: 15,
        ),
        ),
      ));
    }else{
      FirebaseFirestore.instance.collection('TTEquipment')
      //.doc('TT').collection('Equipment')
      .doc(UserDetails.uid).set({
        'tableNumber': choosedTable,
        'racketNumber':choosedRacket,
        'timeOfIsuue': eventDate,
        'name': UserDetails.name,
        'misId':UserDetails.misId,
        'photourl':UserDetails.photourl,
        'isRequested':1,
        'isReturn':false,
        'timeOfReturn':Timestamp.now(),
        'uid': UserDetails.uid,
      });

      setState(() {
        //requested=true;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return TabletannisScreen();
      }));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff48d683),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_xj6d5ul8.json'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "  Hi $_name, \n  Let's Issue the racket",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      // width: ,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                          bottomRight: Radius.circular(22.0),
                          bottomLeft: Radius.circular(22.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Text("Select The Table"),
                              DropDown(
                                ItemList: const [
                                  'Table 1',
                                  'Table 2',
                                  'Table 3',
                                ],
                                item1: 'Table',
                                submitFn: _selected_table,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Text("No. of Racket  "),
                              DropDown(
                                  ItemList: const ['1', '2', '3', '4'],
                                  item1: 'Racket',
                                  submitFn: _selected_Racket),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Time Of Issuement', style: TextStyle(fontSize: 15,)),
                                ),
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
                                      icon: Icon(Icons.date_range_outlined,color: Colors.blue,size: 35,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(color: Colors.black12,width: 2),
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
                      )),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Submit(context);
                    },
                    color: Colors.white,
                    splashColor: Colors.lightBlueAccent,
                    elevation: 10.0,
                    shape: const StadiumBorder(),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Text('SEND THE REQUEST')),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  // child: Text(
                  //   // 'Note: Your request has been sent,\nThe Racket will be issued after accepting the request',
                  //   style: TextStyle(fontSize: 15, color: Colors.white),
                  // ),
                )
              ],
            ),
          ),
        ));
  }
}

class DropDown extends StatefulWidget {
  final List ItemList;
  final String item1;
  final void Function(String selectedValue) submitFn;
  DropDown(
      {required this.ItemList, required this.item1, required this.submitFn});
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedValue = "";
  // String? trt;
  // = widget.item1;
  @override
  void initState() {
    // TODO: implement initState
    // trt = widget.item1;
    // print("itrt = $trt");
    selectedValue = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      isExpanded: true,
      hint: Row(
        children: [
          const Icon(
            Icons.list,
            size: 16,
            color: Colors.yellow,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.item1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      items: widget.ItemList.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              // overflow: TextOverflow.ellipsis,
            ),
          )).toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;
          widget.submitFn(selectedValue!);
          // print("itrt = $trt");
          value = null;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_rounded,
      ),
      iconSize: 34,
      iconEnabledColor: Colors.yellow,
      iconDisabledColor: Colors.grey,
      buttonHeight: 50,
      buttonWidth: 150,
      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.black26,
        ),
        color: Colors.redAccent,
      ),
      buttonElevation: 2,
      itemHeight: 40,
      itemPadding: const EdgeInsets.only(left: 14, right: 14),
      dropdownMaxHeight: 200,
      dropdownWidth: 200,
      dropdownPadding: null,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.redAccent,
      ),
      dropdownElevation: 8,
      scrollbarRadius: const Radius.circular(40),
      scrollbarThickness: 6,
      scrollbarAlwaysShow: true,
      offset: const Offset(-20, 0),
    );
  }
}
