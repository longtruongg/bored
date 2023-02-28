import 'package:bored/model/model.dart';
import 'package:bored/screens/explore_screen.dart';
import 'package:bored/screens/groking_screen.dart';
import 'package:bored/screens/repices_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final int currentTab;

  const Home({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> widgetList = <Widget>[
    ExploreScreen(),
    Repicies(),
    const GrokingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FoodLich",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: IndexedStack(index: widget.currentTab, children: widgetList),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentTab,
        onTap: (index) {
          Provider.of<AppStateManager>(context, listen: false)
              .goIndexTab(index);
          context.goNamed('home', params: {
            'tab': '$index',
          });
          print("Index $index");
        },
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: "Recipes"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "To Buy"),
        ],
      ),
    );
  }
}
