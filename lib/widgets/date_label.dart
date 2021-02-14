import 'package:flutter/material.dart';
import 'package:jizt/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateLabel extends StatelessWidget {
  const DateLabel({
    Key key,
    @required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          timeago.format(date),
          style: TextStyle(
            fontSize: 10,
            color: appPalette['primaryColor'],
          ),
        ),
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          )),
    );
  }
}
