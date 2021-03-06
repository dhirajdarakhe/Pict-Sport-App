import 'package:flutter/material.dart';


class sportContainer extends StatefulWidget {

  sportContainer({required this.Discription,
    required this.headline,
    required this.fondSize});
  String? headline;
  String? Discription;
  double fondSize;

  @override
  _sportContainerState createState() => _sportContainerState();
}

class _sportContainerState extends State<sportContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '''
${widget.headline} ''',
          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '${widget.Discription}',
                  style:
                       TextStyle(fontSize: widget.fondSize,
                           fontFamily: "Poppins"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

