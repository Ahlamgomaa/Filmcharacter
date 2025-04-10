import 'package:filmcharacters/business%20logic/cubit/characters_cubit.dart';
import 'package:filmcharacters/constants/app_color.dart';
import 'package:filmcharacters/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/character_items.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBloc() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedList();
        } else {
          return CircularProgressIndicator(color: AppColor.yellow);
        }
      },
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.grey,
        child: Column(children: [buildCharacterGrid()]),
      ),
    );
  }

  Widget buildCharacterGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisExtent: 1,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItems();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.yellow,
          title: Text(
            'Characters',
            style: TextStyle(
              color: AppColor.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: buildBloc(),
      ),
    );
  }
}
