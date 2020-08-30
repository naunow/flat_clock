import 'dart:async';
import 'package:flutter/material.dart';

class DateDisplay extends StatefulWidget {
  @override
  _DateDisplayState createState() => _DateDisplayState();
}

class _DateDisplayState extends State<DateDisplay> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Zero Padding
    String hour = _dateTime.hour.toString().padLeft(2, '0');
    String minute = _dateTime.minute.toString().padLeft(2, '0');

    // Weekday Display
    List<String> weekDay = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    String date = weekDay[_dateTime.weekday - 1];

    String period =
        TimeOfDay.fromDateTime(_dateTime).period == DayPeriod.am ? 'AM' : 'PM';
    // String second = _dateTime.second.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$hour : $minute',
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 4),
            child: Text('$period'),
          ),
        ],
      ),
    );
  }
}
