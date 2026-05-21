import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/card_item.dart';
import 'package:movies_app/ui/home/tabs/brouse/view_model/films_view_model.dart';

import '../../../../../model/films_response/Movies.dart';

class FilmsList extends StatelessWidget {
   String selectedGenre;
   FilmsList({required this.selectedGenre});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>FilmsViewModel()..getFilms(selectedGenre) ,
      child: BlocBuilder<FilmsViewModel,FilmsState>(
        builder: (context, state) {
          switch(state){
            case FilmsLoadingState():{
              return Center(child: CircularProgressIndicator(),);
            }
            case FilmsErrorState():{
              return Center(child: Text(state.errorMessage),);
            }
            case FilmsSuccessState():{
              List<Movie> movies = state.movies;
              if(movies.isEmpty){
                return Center(child: Text("No Movies found"),);
              }
              return Padding(
                padding: REdgeInsets.only(top: 16,left: 16,right: 16,bottom:0),
                child: GridView.builder(
                  //padding: REdgeInsets.zero,
                    itemCount: movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.67,
                    ),
                    itemBuilder: (context,index)=>CardItem(movie: movies[index],)),
              );
            }
          }

        },
      ),
    );
  }
}
