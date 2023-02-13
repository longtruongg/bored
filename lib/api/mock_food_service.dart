import 'dart:convert';

import 'package:bored/model/explore_recipe.dart';
import 'package:bored/model/model.dart';
import 'package:flutter/services.dart';

import '../model/explore_data.dart';

class MockFoodService {
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipe();
    final friendPost = await _getFriendFeed();
    return ExploreData(todayRecipes, friendPost);
  }

  Future<List<ExploreRecipe>> _getTodayRecipe() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString =
        await _loadAsset("assets/sample/sample_explore_recipes.json");
    final Map<String, dynamic> jsonData = jsonDecode(dataString);
    if (jsonData['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      jsonData['recipes'].forEach((key, value) {
        recipes.add(ExploreRecipe.fromJson(value));
      });
      return recipes;
    } else {
      return [];
    }
  }

  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString =
        await _loadAsset("assets/sample/sample_friends_feed.json");
    final Map<String, dynamic> jsonData = jsonDecode(dataString);
    if (jsonData['feed'] != null) {
      final post = <Post>[];
      jsonData['feed'].forEach((v) {
        post.add(Post.fromJson(v));
      });
      return post;
    }
    return [];
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
  Future<List<SimpleRecipe>>getRecipes()async{
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
    await _loadAsset('assets/sample/sample_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(SimpleRecipe.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }
}
