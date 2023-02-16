import 'package:bored/api/mock_food_service.dart';
import 'package:bored/compoments/compoments.dart';
import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';

class Repicies extends StatelessWidget {
  final exploreRecipie = MockFoodService();

  Repicies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreRecipie.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          return RecipieGribView(
            recpieList: snapShot.data ?? [],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
