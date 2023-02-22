import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class GrokingItemScreen extends StatefulWidget {
  final Function(GrokingItem) onCreate;
  final Function(GrokingItem) onUpdate;
  final GrokingItem? originalItem;
  final bool isUpdating;

  const GrokingItemScreen(
      {Key? key,
      required this.onCreate,
      required this.onUpdate,
      required this.originalItem})
      : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<GrokingItemScreen> createState() => _GrokingItemScreenState();
}

class _GrokingItemScreenState extends State<GrokingItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  TimeOfDay _timeDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSlieValue = 0;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _dateTime = originalItem.timestamp;
      _importance = originalItem.importance;
      _timeDay = TimeOfDay(
          hour: originalItem.timestamp.hour,
          minute: originalItem.timestamp.minute);
      _currentColor = originalItem.color;
      _currentSlieValue = originalItem.quantity;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        title: Text(
          "Item",
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildName(),
            buildImportance(),
            buildDate(context),
            buildTimestamp(context),
            buildColorPicker(context)
          ],
        ),
      ),
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Item name",
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
              hintText: "E.g Linux, macOs ..",
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _currentColor)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: _currentColor))),
        )
      ],
    );
  }

  Widget buildImportance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Importance",
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 12.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.low,
              label: const Text(
                "Low",
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: const Text(
                "Medium",
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.medium);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.height,
              label: const Text(
                "Height",
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.height);
              },
            )
          ],
        )
      ],
    );
  }

  Widget buildDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date",
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text("Select"),
              onPressed: () async {
                final date = DateTime.now();
                final selectDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: date,
                    lastDate: DateTime(date.year + 5));
                setState(() {
                  if (selectDate != null) {
                    _dateTime = selectDate;
                  }
                });
              },
            ),
            Text(DateFormat('yyyy-MM-dd').format(_dateTime))
          ],
        )
      ],
    );
  }

  Widget buildTimestamp(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Time of day",
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text("Select"),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if (timeOfDay != null) {
                    _timeDay = timeOfDay;
                  }
                });
              },
            ),
            Text(_timeDay.format(context))
          ],
        )
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text("Select"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: BlockPicker(
                          pickerColor: Colors.white,
                          onColorChanged: (color) => setState(() {
                            _currentColor = color;
                          }),
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Save"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
            )
          ],
        )
      ],
    );
  }
}
