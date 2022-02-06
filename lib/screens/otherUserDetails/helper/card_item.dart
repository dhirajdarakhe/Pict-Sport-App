import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem extends StatefulWidget {
  String? inputString2;
  String? inputString1;
  String? inputString3;
  CardItem(
      {Key? key,
      required this.inputString1,
      this.inputString2,
      this.inputString3})
      : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool? _ismisId = false;
  String? idname = "Mis Id";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.inputString1 == 'About Myself'
                  ? const Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                    )
                  : widget.inputString1 == 'Sport '
                      ? const Icon(
                          Icons.sports_baseball_sharp,
                          size: 35,
                        )
                      : widget.inputString1 == 'Sport '
                          ? const Icon(
                              Icons.sports_baseball_sharp,
                              size: 35,
                            )
                          : widget.inputString1 == 'Date of Birth'
                              ? const FaIcon(
                                  FontAwesomeIcons.birthdayCake,
                                  size: 32,
                                )
                              : widget.inputString1 == 'Roll No'
                                  ? const FaIcon(
                                      Icons.double_arrow_rounded,
                                      size: 40,
                                    )
                                  : const Icon(
                                      Icons.mail,
                                      size: 35,
                                    ),
              const SizedBox(width: 24.0),
              widget.inputString1 != 'MIS ID'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          widget.inputString1!,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        widget.inputString2 != null
                            ? SizedBox(
                                width: 250,
                                child: Text(
                                  widget.inputString2!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15.0,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )
                  : EmailORMisId(
                      misid: widget.inputString2,
                      mail: widget.inputString3,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailORMisId extends StatefulWidget {
  String? mail;
  String? misid;
  EmailORMisId({required this.mail, required this.misid});
  @override
  _EmailORMisIdState createState() => _EmailORMisIdState();
}

class _EmailORMisIdState extends State<EmailORMisId> {
  bool _isMail = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _isMail = false;
                });
              },
              child: Text(
                "MIS ID",
                style: TextStyle(
                  color: !_isMail ? Colors.black : Colors.grey,
                  fontSize: 18.0,
                ),
              ),
            ),
            const Text(
              " / ",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isMail = true;
                });
              },
              child: Text(
                "EMAIL ID",
                style: TextStyle(
                  color: _isMail ? Colors.black : Colors.grey,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          width: 250,
          child: SelectableText(
            _isMail ? '${widget.mail}' : '${widget.misid}',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15.0,
            ),
          ),
        )
      ],
    );
  }
}
