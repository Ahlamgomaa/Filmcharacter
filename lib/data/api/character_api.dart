import 'package:dio/dio.dart';
import 'package:filmcharacters/constants/strings.dart';

class CharacterApi {
late   Dio dio;  
CharacterApi() {
      BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    receiveTimeout:Duration(seconds: 20),
    connectTimeout: Duration(seconds: 20),
      );
      dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try{
       Response response = await dio.get('characters');
    print(response.data.toString());
    return response.data;
    }
    catch (e) {
      print(e.toString());
      return [];
    
    }
   
  
  }
}