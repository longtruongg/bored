import 'package:bored/compoments/groking_tile.dart';
import 'package:bored/model/groking_manager.dart';
import 'package:bored/screens/groking_item_screen.dart';
import 'package:flutter/material.dart';

class GrokingListScreen extends StatelessWidget {
  final GrokingManager manager;

  const GrokingListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = manager.grokingItem;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: item.length,
          itemBuilder: (context, index) {
            final val = item[index];

            return Dismissible(
              key: Key(val.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              onDismissed: (dir) {
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${val.name} item dismissed")));
              },
              child: InkWell(
                child: GrokingTile(
                  key: Key(val.id),
                  grokingItem: val,
                  onComplete: (changed) {
                    if (changed != null) {
                      manager.completeGrokingItem(index, changed);
                    }
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GrokingItemScreen(
                                originalItem: val,
                                onUpdate: (items) {
                                  manager.updateGrokingList(items);
                                },
                                onCreate: (it) {},
                              )));
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16.0,
            );
          },
        ));
  }
}
