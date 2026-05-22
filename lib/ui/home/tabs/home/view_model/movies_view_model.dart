import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/remote/network/api_manger.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/model/films_response/Movies.dart';

class MoviesViewModel extends Cubit<MoviesState>{
  int indexGenre=0;

  MoviesViewModel():super(MoviesLoadingState());



  getAllMovies(String selectedGenre)async{
    try{
      // loading
      emit(MoviesLoadingState());
      var result = await ApiManger.getFilms(selectedGenre);
      if(result.error!="error"){
        // success
        emit(MoviesSuccessState(result.data?.movies??[]));

      }else{
        // error
        emit((MoviesErrorState("error")));
      }
    }catch(e){
      // exception error
      emit(MoviesErrorState(e.toString()));
    }
  }
  void changeTabIndex(){


  }


}
sealed class MoviesState{}

class MoviesLoadingState extends MoviesState{}
class MoviesErrorState extends MoviesState{
  String errorMessage;
  MoviesErrorState(this.errorMessage);
}
class MoviesSuccessState extends MoviesState{
  List<Movie> movies;
  MoviesSuccessState(this.movies);
}