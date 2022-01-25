import 'package:flutter/material.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/services/authentication.dart';

class App_Drawer extends StatefulWidget {
  const App_Drawer({Key? key}) : super(key: key);

  @override
  _App_DrawerState createState() => _App_DrawerState();
}

class _App_DrawerState extends State<App_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(UserDetails.email.toString(),style: TextStyle(fontSize: 20,color: Colors.blue),),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              Authentication().signOut(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.login_sharp,
                  color: Colors.blue,
                ),
                SizedBox(width: 15),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
