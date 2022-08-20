import 'package:app_maps/UI/ui.dart';
import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart'; 

class AnimatedSplashScreenCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: _bodySplash(context),
      //backgroundColor: Colors.red,
      splashIconSize: double.infinity,
      nextScreen: HomePage(), //mainHiome
      duration: 2500,
      //centered: true,
      curve: Curves.easeInExpo,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight, 
      animationDuration:const  Duration(microseconds: 1700), 
      );
  }


  Widget _bodySplash(context){
    final mediaquey = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [

        Column(
        children: [
        SizedBox(height: mediaquey.height * 0.43,),
        Lottie.asset('assets/splash/maps.json' ,
        height: 250 , width: 250),
        ],
      ),

      Positioned( 
        top: mediaquey.height * 0.92,
        child: const  Center(
          child: Text('BY Rodrigo Vidal' , 
          style: TextStyle(color:  Color.fromARGB(255, 60, 93, 202), fontSize: 19,
           fontWeight: FontWeight.bold   ) ),
        )),
      ],
    );
  }


  
}