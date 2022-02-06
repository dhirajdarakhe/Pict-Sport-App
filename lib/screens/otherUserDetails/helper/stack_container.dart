import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:psa/screens/otherUserDetails/helper/custom_clipper.dart';
import 'top_bar.dart';

class StackContainer extends StatelessWidget {
String? imageUrl ;
String? name;
StackContainer({required this.imageUrl, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration:   BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(6, 3), // changes position of shadow
                  ),
                ],
              //BoxShadow
                image: const DecorationImage(
                  image: NetworkImage("https://media.istockphoto.com/photos/sports-equipment"
                      "-on-green-grass-top-view-picture-id905105146?k=20&m=905105146&s=612x612&w=0&h=c-PRgfs29opGsRl_vOnVxZVGnR5YsZyOJ-RPo_gVW7o="),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment:  const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // CircularProfileAvatar(
                //   imageUrl!,
                //   borderWidth: 4.0,
                //   borderColor: Colors.lightBlueAccent,
                //   radius: 70.0,
                // ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 68,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 66,
                          backgroundImage: NetworkImage(imageUrl!),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                 Text(
                  "mr. ${name}",
                  style: const TextStyle(
                    fontSize: 21.0,color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "PICT, PUNE (SE)",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black
                  ),
                ),

              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}

