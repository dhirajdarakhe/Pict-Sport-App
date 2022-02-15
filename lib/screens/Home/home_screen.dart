import 'package:flutter/material.dart';
import 'package:psa/screens/Home/sport.dart';
import 'package:psa/models/userDetails.dart';
import 'package:psa/screens/Home/sports_card.dart';
import 'package:psa/screens/Home/table_tennis/table_tannis_main_screen.dart';

import 'Basketball/basketball.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }


  List<Sport> myList = [];

  void mySportList()
  {
    myList.clear();
    for(int i=0;i<UserDetails.mySportsList!.length;i++){
      if (UserDetails.mySportsList![i]=='BasketBall'){
        myList.add(item4);
      }else if (UserDetails.mySportsList![i]=='VolleyBall'){
        myList.add(item5);
      }else if (UserDetails.mySportsList![i]=='TableTennis'){
        myList.add(item2);
      }else if (UserDetails.mySportsList![i]=='Badminton'){
        myList.add(item6);
      }else if (UserDetails.mySportsList![i]=='Cricket'){
        myList.add(item3);
      }else if (UserDetails.mySportsList![i]=='FootBall'){
        myList.add(item1);
      }else if (UserDetails.mySportsList![i]=='Chess'){
        myList.add(item7);
      }else if (UserDetails.mySportsList![i]=='Gym'){
        myList.add(item8);
      }
    }
  }

  @override
  void initState() {
    mySportList();
    //myList.addAll(List.from(myList));
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      UserDetails.photourl.toString(),
                    ),
                  ),
                ),
              ],
              pinned: true,
              shape: const RoundedRectangleBorder(
                /*borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),*/
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('PICT SPORTS APP'),
                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  const heightFactor = 1.0;
                  final sport = myList[index];
                  final itemPositionOffset = index * itemSize * heightFactor;
                  final difference =
                      scrollController.offset - itemPositionOffset;
                  final percent =
                      1.0 - (difference / (itemSize * heightFactor));
                  double opacity = percent;
                  double scale = percent;
                  if (opacity > 1.0) opacity = 1.0;
                  if (opacity < 0.0) opacity = 0.0;
                  if (percent > 1.0) scale = 1.0;

                  return Align(
                    heightFactor: heightFactor,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: SportsCard(
                          (){
                            if (sport.name=='Table Tennis'){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return TabletannisScreen();
                              }));
                            }else if (sport.name=='Basketball'){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const BasketBall_screen();
                              }));
                            }else{

                            }
                          },
                          index,
                          sport,
                        ),
                      ),
                    ),
                  );
                },
                childCount: myList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
