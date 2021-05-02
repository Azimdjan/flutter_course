
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/componets/circularImage.dart';
import 'package:flutter_app/models/models.dart';

class FriendPostTile extends StatelessWidget{
  final Post post;
  const FriendPostTile({Key key,this.post}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularImage(AssetImage(post.profileImageUrl), imageRadius: 20,),
        SizedBox(width: 16,),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.comment),
                Text("${post.timestamp} mins ago", style: TextStyle(fontWeight: FontWeight.w700),),
              ],
            )
          ),
        )
      ],
    );
  }
}