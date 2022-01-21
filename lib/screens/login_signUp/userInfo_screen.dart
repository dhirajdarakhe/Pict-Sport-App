import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final _formKey = GlobalKey<FormState>();

  late String misId,rollno;
  @override
  Widget build(BuildContext context) {
    double heigth=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserInfo Screen',style: TextStyle(color: Colors.red),),
      ),
      body: Container(
        color: Colors.blue,
        height: heigth,
        width: width,
        child: Container(
          height: heigth*0.8,
          width: width*0.8,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Text('Tick the sports you are intrested in',style: TextStyle(
                  color: Colors.black12,fontSize: 20,
                ),),
              ),
              Expanded(
                flex: 6,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('BasketBall',style: TextStyle(
                              fontSize: 15,
                            ),),

                          ],
                        ),
                      ],
                    ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
