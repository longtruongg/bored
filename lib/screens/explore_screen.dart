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
          final recipes = snapShot.data?.todayRecipes ?? [];
          return Center(
            child: Container(
              child: const Text("Show a Today news"),
            ),
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
