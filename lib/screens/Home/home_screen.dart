import 'package:flutter/material.dart';
import 'package:psa/screens/announcements/announcement_screen.dart';
import 'package:psa/screens/calender/calendar.dart';
import 'package:psa/screens/chats/chat_screen.dart';
import 'package:psa/screens/drawer/drawer.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:psa/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
        topRight: Radius.circular(20)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(0);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.white;
  Color unselectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: const Drawer(
        child: App_Drawer(),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF9C27B0),

        title: const Text('PICT SPORT APP'
          ,style: TextStyle(color: Colors.white),),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
       backgroundColor: const Color(0xFF9C27B0),


        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.white,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState((){
          _selectedItemPosition = index;
          if (_selectedItemPosition==0){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Announcement_Screen();
            }));
          }else if (_selectedItemPosition==1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ChatScreen();
            }));
          }else if (_selectedItemPosition==2){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeScreen();
            }));
          }else if (_selectedItemPosition==3){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CalendarScreen();
            }));
          }else if (_selectedItemPosition==4){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Profile_Screen();
            }));
          }

        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notifications,), label: 'Notification'),
         // BottomNavigationBarItem(icon: Icon(Icons.leaderboard),label: 'leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile')
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.blue.withOpacity(0.2),
          child: GestureDetector(
            onTap: (){
            },
            child: const Text('Welcome to PICT SPORT APP',style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),),
          ),
        ),
      ),
    );
  }
}
