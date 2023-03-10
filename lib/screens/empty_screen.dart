import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset("assets/empty_list.png"),
              ),
            ),
            const Text(
              "No items",
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0,),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
               context.goNamed(
                 'home',
                 params: {
                   'tab':'${FoodTab.recipes}',
                 }
               );
              },
              child: const Text("Click to buy"),
            )
          ],
        ),
      ),
    );
  }
}
