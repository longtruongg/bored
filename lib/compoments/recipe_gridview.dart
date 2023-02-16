import 'package:bored/compoments/recipie_thumbnail.dart';
import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';

class RecipieGribView extends StatelessWidget {
  final List<SimpleRecipe> recpieList;

  const RecipieGribView({Key? key, required this.recpieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: GridView.builder(
          itemCount: recpieList.length,
          itemBuilder: (context, index) {
            final val = recpieList[index];
            return RecipeThumbnail(recipe: val);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          )),
    );
  }
}
