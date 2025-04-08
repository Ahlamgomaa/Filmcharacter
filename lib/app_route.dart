import 'package:filmcharacters/constants/strings.dart';
import 'package:filmcharacters/presentation/screens/character_details_screen.dart';
import 'package:filmcharacters/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case  characterScreen:
        return MaterialPageRoute(builder: (_) => const CharacterScreen());
      case characterDetails:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());      
  
        
    }
  }
}