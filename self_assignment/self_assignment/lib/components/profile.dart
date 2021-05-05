import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints.expand(width: 37,height: 36),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/profile.png")
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Stack(
            children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2)
                    ),
                    //color: Colors.white,
                    constraints: BoxConstraints.expand(width: 12,height: 12),
                  ),
                  bottom: 0,
                  right: 0,),
                Positioned(
                  child: Container(
                    constraints: BoxConstraints.expand(width: 6,height: 6),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                  bottom: 3,
                  right: 3,
                )
            ],
          ),
        ),
        SizedBox(height: 3),
        Row(
            children: [
              Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 16,),
              SizedBox(width: 1,),
              Text("Profile", style: Theme.of(context).textTheme.headline4,)
            ],
          ),
      ],
    );
  }

}