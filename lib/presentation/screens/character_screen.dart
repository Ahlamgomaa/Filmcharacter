import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Character Screen!'),
      ),
    );
  }
}