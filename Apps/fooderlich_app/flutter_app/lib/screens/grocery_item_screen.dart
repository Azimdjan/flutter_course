import 'package:flutter/material.dart';
import 'package:flutter_app/componets/grocery_tile.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/models.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem,int) onUpdate;
  final GroceryItem originalItem;
  final int index;
  final bool isUpdating;

  static MaterialPage page({
  GroceryItem item,
    int index,
    Function(GroceryItem) onCreate,
    Function(GroceryItem, int) onUpdate,
}){
    return MaterialPage(
      name: FooderlichPages.groceryItemDetails,
      key: ValueKey(FooderlichPages.groceryItemDetails),
      child: GroceryItemScreen(
        originalItem: item,
        onUpdate: onUpdate,
        onCreate: onCreate,
        index: index,
      )
    );
  }

  GroceryItemScreen({this.onCreate, this.index, this.onUpdate, this.originalItem})
      : isUpdating = (originalItem != null);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = "";
  Importance _importance = Importance.low;
  DateTime _dueTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    if (widget.originalItem != null) {
      _nameController.text = widget.originalItem.name;
      _currentSliderValue = widget.originalItem.quantity;
      _importance = widget.originalItem.importance;
      _currentColor = widget.originalItem.color;
      final date = widget.originalItem.time;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueTime = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grocery Item",
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final groceryItem = GroceryItem(
                  id: widget.originalItem?.id ?? Uuid().v1(),
                  name: _nameController.text,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  time: DateTime(
                    _dueTime.year,
                    _dueTime.month,
                    _dueTime.day,
                    _timeOfDay.hour,
                    _timeOfDay.minute,
                  ));
              if(widget.isUpdating)
                widget.onUpdate(groceryItem,widget.index);
              else
                widget.onCreate(groceryItem);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildNameField(),
            buildImportanceField(),
            buildDateField(),
            buildTimeField(),
            const SizedBox(
              height: 10,
            ),
            buildColorPicker(context),
            const SizedBox(
              height: 10,
            ),
            buildSliderField(),
            const SizedBox(
              height: 15,
            ),
            GroceryTile(
              item: GroceryItem(
                  name: _name,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  importance: _importance,
                  time: DateTime(
                    _dueTime.year,
                    _dueTime.month,
                    _dueTime.day,
                    _timeOfDay.hour,
                    _timeOfDay.minute,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item name',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
          ),
        )
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Importance",
          style: GoogleFonts.lato(fontSize: 28),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              label: Text(
                'Low',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.low,
              selectedColor: Colors.black,
              onSelected: (_) {
                setState(() {
                  _importance = Importance.low;
                });
              },
            ),
            ChoiceChip(
              label: const Text(
                'Medium',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.medium,
              selectedColor: Colors.black,
              onSelected: (_) {
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              label: const Text(
                "High",
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.high,
              selectedColor: Colors.black,
              onSelected: (_) {
                setState(() {
                  _importance = Importance.high;
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: Text("Select"),
              onPressed: () async {
                final currentDate = DateTime.now();

                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueTime = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        if (_dueTime != null) Text(DateFormat('yyyy-MM-dd').format(_dueTime)),
      ],
    );
  }

  Widget buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Time of the Day!",
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: const Text("Select"),
              onPressed: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  setState(() {
                    _timeOfDay = selectedTime;
                  });
                }
              },
            ),
          ],
        ),
        if (_timeOfDay != null) Text(_timeOfDay.format(context)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Color",
              style: GoogleFonts.lato(fontSize: 28),
            ),
          ],
        ),
        TextButton(
          child: const Text("Select"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("Save"),
                      )
                    ],
                  );
                });
          },
        )
      ],
    );
  }

  Widget buildSliderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Quantity",
              style: GoogleFonts.lato(fontSize: 28),
            ),
            SizedBox(width: 10),
            Text(
              _currentSliderValue.toString(),
              style: GoogleFonts.lato(fontSize: 18),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Slider(
            divisions: 100,
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            label: _currentSliderValue.toInt().toString(),
            min: 0.0,
            max: 100.0,
            value: _currentSliderValue.toDouble(),
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            }),
      ],
    );
  }
}
