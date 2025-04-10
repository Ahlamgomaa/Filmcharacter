import 'package:dio/dio.dart';
import 'package:filmcharacters/constants/strings.dart';

class CharacterApi {
  late Dio dio;

  CharacterApi() {
    BaseOptions options = BaseOptions(
      baseUrl: base,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      return response.data['results'];
    } catch (e) {
      print('❌ Error fetching characters: $e');
      return [];
    }
  }

}
