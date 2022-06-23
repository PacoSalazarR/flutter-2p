import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:examen_2p/pages/LoginPage.dart';
import 'package:examen_2p/utilerias/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Global.basicBackground,
          primarySwatch: Colors.deepPurple,

          fontFamily: 'Arial',
          textTheme: TextTheme(
          headline2:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Global.basicFont),
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Global.basicFont),
          headline6: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic, color: Global.basicFont),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind', color: Global.basicFont),
    ),
        ),
        home: LoginPage(),
      ),
    );
  }
}

