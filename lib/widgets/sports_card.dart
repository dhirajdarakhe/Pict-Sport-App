import 'package:flutter/material.dart';
import 'package:psa/models/sport.dart';

const itemSize = 200.0;

class SportsCard extends StatelessWidget {
  const SportsCard(this.i, this.sport, {Key? key}) : super(key: key);
  final int i;
  final Sport sport;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.accents[i % Colors.accents.length],
      ),
      width: double.infinity,
      child: SizedBox(
        height: itemSize,
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(95),
              topRight: const Radius.circular(95),
              bottomLeft: i % 2 == 0
                  ? const Radius.circular(95)
                  : const Radius.circular(1000),
              bottomRight: i % 2 == 0
                  ? const Radius.circular(1000)
                  : const Radius.circular(95),
            ),
            child: Image.asset(
              sport.img,
              width: double.infinity,
              height: itemSize,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 25,
            right: i % 2 == 0 ? 10 : null,
            left: i % 2 != 0 ? 10 : null,
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                sport.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                textAlign: i % 2 == 0 ? TextAlign.end : TextAlign.start,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
