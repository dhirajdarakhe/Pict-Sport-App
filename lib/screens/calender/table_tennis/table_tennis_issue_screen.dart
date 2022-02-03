import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lottie/lottie.dart';
import 'package:psa/screens/calender/table_tennis/table_tannis_main_screen.dart';
import 'package:psa/screens/chats/chat_members.dart';


class IssueTheRacket extends StatefulWidget {
  const IssueTheRacket({Key? key}) : super(key: key);

  @override
  State<IssueTheRacket> createState() => _IssueTheRacketState();
}

class _IssueTheRacketState extends State<IssueTheRacket> {
  late var isRequestSent = false;
  String? choosedTable;
  String? choosedTime;
  String? choosedRacket;

  void _selected_table(String table) => choosedTable = table;

  void _selected_time(String time) => choosedTime = time;

  void _selected_Racket(String racket) => choosedRacket = racket;

  // This is the trick to restart the page
  void _reset() {
    // Navigator.pushReplacement(
    //   context,
    //   PageRouteBuilder(
    //     transitionDuration: Duration.zero,
    //     pageBuilder: (_, __, ___) => const IssueTheRacket(),
    //   ),
    // );
    choosedTable = null;
    choosedTime = null;
    choosedRacket = null;
  }

  void _submitForm(BuildContext context) {
    if (choosedTable == null || choosedTime == null || choosedRacket == null) {
      Scaffold.of(context).hideCurrentSnackBar();

      Scaffold.of(context).showSnackBar(
        const SnackBar(
          content: Text('  Please completely fill the form '),
          duration: Duration(seconds: 1),
        ),
      );
    } else if (choosedTable != null &&
        choosedTime != null &&
        choosedRacket != null) {
      setState(() {
        isRequestSent = !isRequestSent;
      });
      // print(" choosedTable == $choosedTable ");
      // print(" choosedTime == $choosedTime ");
      // print(" choosedRacket == $choosedRacket ");
    }
  }

  void _cancleRequest() {
    /// to cancle the request that just sent
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Accept"),
          content: const Text("Do you want to cancle the request ?"),
          actions: [
            FlatButton(
                onPressed: () {
                  setState(() {
                    isRequestSent = !isRequestSent;
                    _reset();
                  });
                  Navigator.of(context).pushNamed(TabletannisScreen.routeName );
                },
                child: const Text("YES")),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ],
          elevation: 24.0,
          backgroundColor: const Color(0xff48d683),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff48d683),
        body: SafeArea(
          bottom: true,
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.only(
                  top: 1.0, left: 8.0, right: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: Lottie.network(
                          'https://assets7.lottiefiles.com/packages/lf20_xj6d5ul8.json'),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "  Hi Dhiraj, \n  Let's Issue the racket",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 60, top: 50),
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
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                      child: const Text("Select The Table")),
                                  // const SizedBox(
                                  //   width: 20.0,
                                  // ),
                                  Container(
                                    // child: Expanded(
                                    child: DropDown(
                                      ItemList: const [
                                        'Table 1',
                                        'Table 2',
                                        'Table 3',
                                      ],
                                      item1: 'Table',
                                      submitFn: _selected_table,
                                    ),
                                    // ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const Text("No. of Racket  "),
                                  Container(
                                    child: DropDown(
                                        ItemList: const ['1', '2', '3', '4'],
                                        item1: 'Racket',
                                        submitFn: _selected_Racket),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.,
                                children: <Widget>[
                                  Container(
                                      child: const Text("Select the Time   ")),
                                  Container(
                                    child: DropDown(
                                      ItemList: const [
                                        '1 hour',
                                        '2 hour',
                                        '3 hour'
                                      ],
                                      submitFn: _selected_time,
                                      item1: 'Time',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),
                  Center(
                    child: Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            if (!isRequestSent) {
                              _submitForm(context);
                            } else {
                              _cancleRequest();
                            }
                          });
                        },
                        color: Colors.white,
                        splashColor: Colors.lightBlueAccent,
                        elevation: 10.0,
                        shape: const StadiumBorder(),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: !isRequestSent
                                ? const Text('SEND THE REQUEST')
                                : const Text('CANCLE THE REQUEST')),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: isRequestSent
                        ? const Text(
                      'Note: Your request has been sent,\n The Racket will be issued after accepting the request',
                      style: TextStyle(color: Colors.grey),
                    )
                        : const Text(""),
                  )
                ],
              ),
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
      items: widget.ItemList
          .map((item) => DropdownMenuItem<String>(
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
      ))
          .toList(),
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
