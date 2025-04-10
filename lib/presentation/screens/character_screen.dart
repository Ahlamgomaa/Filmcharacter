import 'package:filmcharacters/business%20logic/cubit/characters_cubit.dart';
import 'package:filmcharacters/constants/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character.dart';
import '../widgets/character_items.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBloc() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return buildLoadedList(state.characters);
        } else {
          return CircularProgressIndicator(color: AppColor.yellow);
        }
      },
    );
  }

  Widget buildLoadedList(List<Character> characters) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.grey,
        child: Column(children: [buildCharacterGrid(characters)]),
      ),
    );
  }

  Widget buildCharacterGrid(List<Character> characters) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisExtent:250 ,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterItems(character: characters[index]);
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
