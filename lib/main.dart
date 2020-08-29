import 'package:flatclock/models/my_theme_provider.dart';
import 'package:flatclock/screens/home_screen.dart';
import 'package:flatclock/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
// SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);

// to hide only status bar:
// SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);

// to hide both:
    SystemChrome.setEnabledSystemUIOverlays([]);
    return ChangeNotifierProvider(
      create: (context) => MyThemeModel(),
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Flat Clock',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
