

import 'package:filmcharacters/data/models/character.dart';
import 'package:filmcharacters/data/repos/character_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
  late List <Character> characters ;
  CharactersCubit(this.characterRepo) : super(CharactersInitial());
List <Character> getAllCharacters(){
  characterRepo.getAllCharacters().then((characters){
   emit(CharactersLoaded(characters));
   this.characters = characters; 
  });
  return characters;  
}
}
