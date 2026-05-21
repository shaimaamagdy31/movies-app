import 'package:dio/dio.dart';
import 'package:movies_app/model/films_response/Films_response.dart';

class ApiManger {
  static Dio dio = Dio(
      BaseOptions(
          baseUrl: "https://movies-api.accel.li/api/v2/"
      )
  );
  static Future<FilmsResponse> getFilms(String selectedGenre) async {
    var response = await dio.get("list_movies.json",queryParameters: {
      "genre":selectedGenre
    });

    FilmsResponse filmsResponse=FilmsResponse.fromJson(response.data);
    return filmsResponse;

  }






}