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
      color: const Color(0xFF757575),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          CircleAvatar(
           backgroundImage: NetworkImage(UserDetails.photourl.toString()),
            radius: 60,
          ),
          const SizedBox(height: 20,),
          Text(UserDetails.name.toString(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          Text(UserDetails.misId.toString(),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),),
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Divider(thickness: 5,
            color: Colors.black12,),
          ),
          Column(
            children: [
              DrawerRefactor(onTap: (){
                Authentication().signOut(context);
              },text: 'Logout',Icon:
              const Icon(
                Icons.logout_outlined,
                color: Colors.white,
                size: 30,
              ),),
            ],
          )
        ],
      ),
    );
  }
}

class DrawerRefactor extends StatelessWidget {
  late String text;
  late VoidCallback onTap;
  late Widget Icon;

  DrawerRefactor({required this.Icon,required this.onTap,required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon,
          const SizedBox(width: 5,),
          Text(text,
            style: const TextStyle(fontSize: 20,
                color: Colors.white),)
        ],
      ),
    );
  }
}
