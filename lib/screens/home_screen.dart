import 'dart:convert';
import 'dart:io';

import 'package:flatclock/constants.dart';
import 'package:flatclock/models/my_theme_provider.dart';
import 'package:flatclock/screens/calender.dart';
import 'package:flatclock/screens/clock.dart';
import 'package:flatclock/screens/date_display.dart';
import 'package:flatclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          color: Theme.of(context).iconTheme.color,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => TimeZoneList())),
        ),
        actions: [
          Consumer<MyThemeModel>(
            builder: (context, theme, child) => IconButton(
              icon: theme.isLightTheme
                  ? Icon(Icons.wb_sunny)
                  : Icon(Icons.brightness_3),
              color: Theme.of(context).primaryColor,
              onPressed: () => theme.changeTheme(),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Clock(),
          SizedBox(
            height: 30,
          ),
          DateDisplay(),
        ],
      ),
    );
  }
}

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

            var map = {'Asia/Tokyo': '+09:00', 'Europe/London': '+01:00'};
            var keylist = map.keys.toList();
            var valuelist = map.values.toList();

            return ListView.builder(
                itemCount: keylist.length, //timezoneItemList.length,
                itemBuilder: (context, index) {
                  // Connection successed
                  // return Text(timezoneItemList[index]);
                  return ListTile(
                    // title: Text(timezoneItemList[index]),
                    title: Text(keylist[index]),
                    subtitle: Text(valuelist[index]),
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
