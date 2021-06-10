import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 25),
            height: 275,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 8,),
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 12,),
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 5,),
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    width: double.infinity,
                    color: Colors.red,
                    height: 141,
                    child: Icon(Icons.image,size: 60,),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
