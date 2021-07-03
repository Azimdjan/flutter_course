import 'package:flutter/material.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool) onComplete;
  final TextDecoration textDecoration;

  GroceryTile({Key key, this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 5,
              color: item.color,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.item.name,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    decoration: textDecoration,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                buildDate(),
                const SizedBox(
                  height: 4,
                ),
                buildImportance(),
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.item.quantity.toString(),
              style: GoogleFonts.lato(fontSize: 21, decoration: textDecoration),
            ),
            buildCheckBox(),
          ],
        ),
      ],
    );
  }

  Widget buildImportance() {
    if (this.item.importance == Importance.low)
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    else if (this.item.importance == Importance.medium)
      return Text(
        'Medium',
        style: GoogleFonts.lato(
            decoration: textDecoration, fontWeight: FontWeight.w800),
      );
    else if (this.item.importance == Importance.high)
      return Text(
        'High',
        style: GoogleFonts.lato(
            decoration: textDecoration,
            fontWeight: FontWeight.w900,
            color: Colors.red),
      );
    else
      return Text("Invalid");
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(this.item.time);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckBox() {
    return Checkbox(value: this.item.isComplete, onChanged: onComplete);
  }
}
