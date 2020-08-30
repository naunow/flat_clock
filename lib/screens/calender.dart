import 'package:flatclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, WeekdayFormat;

class Calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double calenderWidth = SizeConfig.screenWidth;
    double calenderHeight = SizeConfig.screenHeight;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: calenderHeight,
        width: calenderWidth,
        child: CalendarCarousel<Event>(
          weekdayTextStyle: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
