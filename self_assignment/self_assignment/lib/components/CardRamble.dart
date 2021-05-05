import 'package:flutter/material.dart';

class CardRamble extends StatelessWidget{
  final String bodyText;
  final String title;
  final ImageProvider img;
  const CardRamble({this.img,this.title,this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: 180,height: 337),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this.img,
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: [
          Positioned(
            child: Text(this.title,style: Theme.of(context).textTheme.headline1,),
            top: 30,
            left: 18,
          ),
          Positioned(
            child: Container(
              constraints: BoxConstraints.expand(width: 75,height: 105),
              child: Text(this.bodyText,
              style: Theme.of(context).textTheme.bodyText2,),
            ),
            top: 120,
            left: 18,
          ),
          Positioned(
            bottom: 24,
            left: 28,
            child: Container(
                constraints: BoxConstraints.expand(width: 50,height: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.1)
                ),
                child: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}