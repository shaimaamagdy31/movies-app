import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/remote/network/api_manger.dart';
import 'package:movies_app/model/films_response/Movies.dart';

class FilmsViewModel extends Cubit<FilmsState>{

  FilmsViewModel():super(FilmsLoadingState());

  getFilms(String selectedGenre)async{
    try{
      // loading
      emit(FilmsLoadingState());
      var result = await ApiManger.getFilms(selectedGenre);
      if(result.error!="error"){
        // success
        emit(FilmsSuccessState(result.data?.movies??[]));
      }else{
        // error
        emit((FilmsErrorState("error")));
      }
    }catch(e){
      // exception error
      emit(FilmsErrorState(e.toString()));
    }
  }


}
sealed class FilmsState{}

class FilmsLoadingState extends FilmsState{}
class FilmsErrorState extends FilmsState{
  String errorMessage;
  FilmsErrorState(this.errorMessage);
}
class FilmsSuccessState extends FilmsState{
  List<Movie> movies;
  FilmsSuccessState(this.movies);
}