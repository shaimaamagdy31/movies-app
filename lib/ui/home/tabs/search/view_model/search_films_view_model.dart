import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/remote/network/api_manger.dart';
import 'package:movies_app/model/films_response/Movies.dart';

class SearchFilmsViewModel extends Cubit<SearchStates>{
  int page=1;
  final TextEditingController searchController=TextEditingController();
  final ScrollController scrollController=ScrollController();
  final List<Movie> allMovies=[];

  SearchFilmsViewModel():super(SearchInitialState()){
    scrollController.addListener((){
      if(scrollController.position.atEdge){
        bool isTop=scrollController.position.pixels==0;
        if(!isTop){
          searchFilms(isLoadingMore: true);
        }
      }
    });
  }

  searchFilms({bool isLoadingMore=false})async{
    String query=searchController.text.trim();
    try{
       if(query.isEmpty)return;
       //call func for 2 times => true
       if(isLoadingMore){
         page++;
       }else{
         page=1;
         allMovies.clear();
         // loading
         emit(SearchLoadingState());
       }
      var result = await ApiManger.searchAboutFilms(query,page);
      if(result.error!="error"){
        // success
        List<Movie> newMovies=result.data?.movies??[];
        allMovies.addAll(newMovies);
        emit(SearchSuccessState(allMovies));
      }else{
        // error
        emit((SearchErrorState("Something went wrong")));
      }
    }catch(e){
      // exception error
      emit(SearchErrorState(e.toString()));
    }
  }

  @override
  Future<void> close(){
    searchController.dispose();
    scrollController.dispose();
    return super.close();

  }
  void clearSearch(){
    searchController.clear();
    emit(SearchInitialState());

  }
}

sealed class SearchStates{}

class SearchInitialState extends SearchStates{}
class SearchLoadingState extends SearchStates{}
class SearchErrorState extends SearchStates{
  String errorMessage;
  SearchErrorState(this.errorMessage);
}
class SearchSuccessState extends SearchStates{
  List<Movie> movies;
  SearchSuccessState(this.movies);
}