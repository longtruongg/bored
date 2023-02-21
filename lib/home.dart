import 'package:bored/model/model.dart';
import 'package:bored/screens/explore_screen.dart';
import 'package:bored/screens/groking_screen.dart';
import 'package:bored/screens/repices_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  static List<Widget> widgetList = <Widget>[
    ExploreScreen(),
    Repicies(),
    GrokingScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "FoodLich",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: widgetList[tabManager.selectTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabManager.selectTab,
            onTap: (index) {
              tabManager.goBackTab(index);
            },
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
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
      },
    );
  }
}
