
import 'package:filmcharacters/data/api/character_api.dart';
import 'package:filmcharacters/data/models/character.dart';

class CharacterRepo {
 final  CharacterApi characterApi;
  CharacterRepo(
     this.characterApi,
  );

  Future<List<Character>> getAllCharacters() async {
  
     final characters = await characterApi.getAllCharacters();
      return characters.map((character) =>Character.fromJson(character)).toList();
   
  
  }
}
