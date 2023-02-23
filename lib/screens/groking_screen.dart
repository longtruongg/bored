import 'package:bored/model/groking_manager.dart';
import 'package:bored/screens/empty_screen.dart';
import 'package:bored/screens/groking_item_screen.dart';
import 'package:bored/screens/groking_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrokingScreen extends StatelessWidget {
  const GrokingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final manager = Provider.of<GrokingManager>(context, listen: false);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GrokingItemScreen(
                          onCreate: (item) {
                            manager.addItem(item);
                            Navigator.pop(context);
                          },
                          onUpdate: (item) {},
                          originalItem: null,
                        )));
          }),
      body: buildGroking(),
    );
  }
}

Widget buildGroking() {
  return Consumer<GrokingManager>(builder: (context, manager, child) {
    if (manager.grokingItem.isNotEmpty) {
      return GrokingListScreen(manager: manager);
    } else {
      return const EmptyScreen();
    }
  });
}
