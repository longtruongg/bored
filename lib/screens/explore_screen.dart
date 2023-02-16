import 'package:bored/compoments/compoments.dart';
import 'package:bored/model/explore_data.dart';
import 'package:flutter/material.dart';

import '../api/mock_food_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final mockService = MockFoodService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipeList: snapShot.data?.todayRecipes ?? [],
              ),
              const SizedBox(
                height: 16.0,
              ),
              FriendPostList(friendPost: snapShot.data?.friendPosts ?? []),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
