import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class TimeZoneList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _getTimeZoneJson(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            var timezoneItemList = json.decode(snapshot.data);

            return ListView.builder(
                itemCount: timezoneItemList.length, //timezoneItemList.length,
                itemBuilder: (context, index) {
                  // TimeZone Name
                  String timezone = timezoneItemList[index]['timezone'];
                  // UTC
                  String utc = timezoneItemList[index]['utc_offset'];
                  // Time Difference(compare to Utc) ex) -09:00 -> -9
                  var timeDifference = int.parse(utc.split(':')[0]);
                  var localDateTime = DateTime.now()
                      .toUtc()
                      .add(Duration(hours: timeDifference));
                  // Connection successed
                  return ListTile(
                    title: Text(
                      timezone,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text('UTC$utc',
                        style: Theme.of(context).textTheme.caption),
                    trailing: Text(
                        '${localDateTime.hour.toString().padLeft(2, '0')}:${localDateTime.minute.toString().padLeft(2, '0')}'),
                    onTap: () {
                      debugPrint('on tap');
                    },
                    onLongPress: () {
                      debugPrint('on long press');
                    },
                  );
                });
            // Loading
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Connection Error
          return Center(
            child: Icon(
              Icons.error_outline,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}

Future<String> _getTimeZoneJson() async {
  // Write code to get time zone list with API.
  // var url = "http://worldtimeapi.org/api/timezone";
  // final response = await http.get(url);
  // debugPrint('Response status:${response.statusCode}');
  // debugPrint('Response body:${response.body}');

  // return response.body;

  var data = await rootBundle.loadString('json/TimeZone_Region_UTC.json');
  debugPrint(data);
  return data;
}
