import 'package:bored/food_theme.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({Key? key}) : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  final String chefName = "Mike Katz";

  final String chefDes = "Smoothie Composition";

  final String productName = "Smoothies";

  final String repice = "Recipe";

  bool isLike = false;

  bool get isFav => isLike;

  _isLike() {
    setState(() {
      isLike = !isLike;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          image: const DecorationImage(image: AssetImage("assets/mag5.png")),
        ),
        child: Column(
          children: [
            //Author header
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundImage: AssetImage("assets/author.jpeg"),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chefName,
                        style: FoodLichTheme.lightTheme.headlineMedium,
                      ),
                      Text(
                        chefDes,
                        style: FoodLichTheme.lightTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      _isLike();
                    },
                    icon: Icon(
                      isLike ? Icons.favorite : Icons.favorite_border,
                    ),
                    iconSize: 30,
                    color: Colors.red[400],
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Text(
                      repice,
                      style: FoodLichTheme.lightTheme.headlineLarge,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16.0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        productName,
                        style: FoodLichTheme.lightTheme.headlineLarge,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
