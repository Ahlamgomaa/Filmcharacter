import 'package:filmcharacters/data/models/character.dart';
import 'package:filmcharacters/data/repos/character_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
  List<Character> characters = [];

  CharactersCubit(this.characterRepo) : super(CharactersInitial());

  void getAllCharacters() {
    characterRepo.getAllCharacters().then((characters) {
      print('✅ Characters Fetched: ${characters.length}');
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
  }
}
