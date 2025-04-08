import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget{
  const CharacterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Details'),
      ),
      body: Center(
        child: Text('Character Details Screen'),
      ),
    );
  }
}