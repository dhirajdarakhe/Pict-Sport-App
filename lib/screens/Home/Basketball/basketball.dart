import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psa/screens/Home/Basketball/sizeNo.dart';
import 'package:psa/screens/otherUserDetails/helper/custom_clipper.dart';

class BasketBall_screen extends StatefulWidget {
  const BasketBall_screen({Key? key}) : super(key: key);

  @override
  _BasketBall_screenState createState() => _BasketBall_screenState();
}

class _BasketBall_screenState extends State<BasketBall_screen> {
  @override
  Widget build(BuildContext context) {
    double weight = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: weight,
        height: height,
        child: Column(
          children: [
            StackContainer(),
            const Text(
              'Select Ball Size you want to issue',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return const SixNo();
                     }));
                    },
                    child: Container(
                      height: height * 0.3,
                      width: weight * 0.4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/6bb.jpg',
                              ),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: height * 0.3,
                      width: weight * 0.4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/7bb.jpg',
                              ),
                              fit: BoxFit.fill)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class StackContainer extends StatelessWidget {
  StackContainer();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 390.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              width: double.infinity,
              child: Lottie.asset('assets/bb_lotty.json'),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(6, 3), // changes position of shadow
                  ),
                ],
                //BoxShadow
                /*image: const DecorationImage(
                  image: NetworkImage("https://media.istockphoto.com/photos/sports-equipment"
                      "-on-green-grass-top-view-picture-id905105146?k=20&m=905105146&s=612x612&w=0&h=c-PRgfs29opGsRl_vOnVxZVGnR5YsZyOJ-RPo_gVW7o="),
                  fit: BoxFit.cover,
                ),*/
              ),
            ),
          ),
          Positioned(
            top: height * 0.06,
            //left: double.infinity-10,
            right: width * 0.06,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
