import 'package:flutter/cupertino.dart';

import 'components.dart';
class GridViewCards extends StatelessWidget {
  static final ImageProvider img1 = AssetImage("assets/img/Rectangle1.jpg");
  static final ImageProvider img2 = AssetImage("assets/img/Rectangle2.jpg");
  static final ImageProvider img3 = AssetImage("assets/img/Rectangle3.jpg");
  static final ImageProvider img4 = AssetImage("assets/img/Rectangle4.jpg");
  static List<CardRamble> cards = [
    CardRamble(img: img1, title: "Tulum,\nMexico",
      bodyText: "You'll love Tulum Mexico. "
          "Get the BEST deals on hotels, "
          "all inclusive resorts, condo rentals and fun "
          "things to do in Tulum on the only Tulum.com.",),
    CardRamble(img: img2, title: "Li River,\nChina",
      bodyText: "Li River, one of China's most famous scenic "
          "areas, was listed as one of the world's top ten "
          "watery wonders by America National Geographic Magazine.",),
    CardRamble(img: img3, title: "Yellow\nShoal",
      bodyText: "You'll love Tulum Mexico. Get the BEST deals on "
          "hotels, all inclusive resorts, condo rentals and fun "
          "things to do in Tulum.",),
    CardRamble(img: img4, title: "Daxu\nAncient",
      bodyText: "As you travel further along the Li River, "
          "you’ll pass the ancient town of Daxu on the east bank.",)
  ];

  const GridViewCards();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 0.5),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          var card = cards[index];
          return card;
        }
    );
  }
}