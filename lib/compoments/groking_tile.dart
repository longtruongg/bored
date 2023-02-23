import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/groking_item.dart';

class GrokingTile extends StatelessWidget {
  final GrokingItem grokingItem;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GrokingTile({Key? key, required this.grokingItem, this.onComplete})
      : textDecoration = grokingItem.isComplete
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 5.0,
            color: grokingItem.color,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                grokingItem.name,
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              buildDate(),
              const SizedBox(
                height: 4.0,
              ),
              buildImportance()
            ],
          ),
          Row(
            children: [
              Text(
                grokingItem.quantity.toString(),
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              buildCheckbox(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (grokingItem.importance == Importance.low) {
      return Text(
        "Low",
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else if (grokingItem.importance == Importance.medium) {
      return Text("Medium",
          style: GoogleFonts.lato(decoration: textDecoration));
    } else if (grokingItem.importance == Importance.height) {
      return Text(
        "Height",
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else {
      throw Exception("This importance not exists");
    }
  }

  Widget buildDate() {
    final dateFormart = DateFormat("MMMM dd h:mm a");
    final dateString = dateFormart.format(grokingItem.timestamp);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(value: grokingItem.isComplete, onChanged: onComplete);
  }
}
