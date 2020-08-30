import 'package:flatclock/constants.dart';
import 'package:flatclock/models/my_theme_provider.dart';
import 'package:flatclock/screens/calender.dart';
import 'package:flatclock/screens/clock.dart';
import 'package:flatclock/screens/date_display.dart';
import 'package:flatclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.view_headline),
        //   color: Theme.of(context).iconTheme.color,
        //   onPressed: () {},
        // ),
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
