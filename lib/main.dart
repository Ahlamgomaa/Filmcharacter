
import 'package:filmcharacters/app_route.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(BreakingBadApp(appRoute:AppRoute()));
}

class BreakingBadApp extends StatelessWidget{
    final AppRoute appRoute ;
  const BreakingBadApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      onGenerateRoute: appRoute.generateRoute,
    );

  }
}
