import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/ui/home/tabs/search/view_model/search_films_view_model.dart';

import '../../../../../core/reusable_components/card_item.dart';
import '../../../../../model/films_response/Movies.dart';

class SearchFilmsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchFilmsViewModel,SearchStates>(
      builder: (context, state) {
        switch(state){
          case SearchInitialState():{
            return Center(child: Image.asset(AssetsManager.empty),);
          }
          case SearchLoadingState():{
            return Center(child: CircularProgressIndicator(color: ColorsManager.yellow,),);
          }
          case SearchErrorState():{
            return Center(child: Text(state.errorMessage),);
          }
          case SearchSuccessState():{
            List<Movie> movies = state.movies;
            if(movies.isEmpty){
              return Center(child: Text("No Movies found",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorsManager.yellow
              ),),);
            }
            return GridView.builder(
              padding: EdgeInsets.zero,
                itemCount: movies.length,
                controller: context.read<SearchFilmsViewModel>().scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.67,
                ),
                itemBuilder: (context,index)=>CardItem(movie: movies[index],)
            );
          }
        }

      },
    );

  }
}
