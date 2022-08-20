
import 'package:app_maps/UI/home_page.dart';
import 'package:app_maps/widgets/animated.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'animated',
      routes: {
        'animated'  : (context) => AnimatedSplashScreenCustom(),
        'home'      :(_) => HomePage(),
      },
    );
  }
}