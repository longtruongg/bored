import 'package:flutter/material.dart';

import '../model/explore_recipe.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';
class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe>recipeList;
  const TodayRecipeListView({Key? key, required this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today List",style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0,),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipeList.length,
              itemBuilder: (context,index){
                final val = recipeList[index];
                return buildCard(val);
              },
              separatorBuilder: (context, index){
                return const SizedBox(width: 16.0,);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe val) {
    if (val.cardType==RecipeCardType.card1){
      return Card1(recipe:val);
    }else if (val.cardType==RecipeCardType.card2){
      return Card2(recipe:val);
    }else if (val.cardType==RecipeCardType.card3){
      return Card3(recipe:val);
    }else{
      throw Exception("Not yet");
    }
  }
}
