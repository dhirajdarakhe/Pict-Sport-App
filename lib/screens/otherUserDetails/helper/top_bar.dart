import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.menu, color: Colors.white),
          // ),
        ],
      ),
    );
  }
}