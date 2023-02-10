import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index=0;
  static List <Widget>widgetList=<Widget>[
    Container(color: Colors.green,),
    Container(color: Colors.redAccent,),
    Container(color: Colors.blue,),
  ];
  _onItemTapped(int index){
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodLich",style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: widgetList[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
      onTap: _onItemTapped,
      selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard,),label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard,),label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard,),label: "Card"),
        ],

      ),
    );
  }
}
