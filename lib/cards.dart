import 'package:bored/food_theme.dart';
import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({Key? key}) : super(key: key);
  final String category = "Editor\'s choice";
  final String title = "The Art of Dough";
  final String description = "Learn to make the perfect bread";
  final String chef = "Ninn";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mag1.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Text(
              category,
              style: FoodLichTheme.darkTheme.bodyLarge,
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FoodLichTheme.darkTheme.headlineSmall,
              ),
            ),
            Positioned(
                bottom: 30,
                right: 0.0,
                child: Text(
                  description,
                  style: FoodLichTheme.darkTheme.bodyMedium,
                )),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(
                  chef,
                  style: FoodLichTheme.darkTheme.bodyLarge,
                ))
          ],
        ),
      ),
    );
  }
}
