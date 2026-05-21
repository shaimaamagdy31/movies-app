import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/customTextFormField.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';
import 'package:movies_app/ui/home/tabs/search/view_model/search_films_view_model.dart';
import 'package:movies_app/ui/home/tabs/search/widgets/search_films_list.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  @override
  Widget build(BuildContext context) {
    final searchCubit=context.read<SearchFilmsViewModel>();
    return Container(
      color: Colors.black,
      padding: REdgeInsets.only(top: 16,right: 16,left: 16),
      child: Column(
        children: [
          CustomTextFormField(
              hintText: StringsManager.searchHint,
              keyboardType: TextInputType.webSearch,
              textInputAction: TextInputAction.done,
              controller: searchCubit.searchController,
              onClickPrefix:searchCubit.searchFilms ,
              onClickSuffix: searchCubit.clearSearch,
              isSearch:true ,
              prefixIconData: AssetsManager.searchIcon
          ),
          SizedBox(height: 16.h,),
          Expanded(child: SearchFilmsList())

        ],
      ),
    );
  }
}
