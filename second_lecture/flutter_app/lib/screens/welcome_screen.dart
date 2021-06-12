// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/constant/rout.dart';
// import 'package:flutter_app/router.dart';
//
// import '../home.dart';
//
// class Welcome_Screen extends StatelessWidget{
//   const Welcome_Screen();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           SizedBox(height: 200,),
//           Text("Welcome!",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
//           SizedBox(height: 200,),
//           FlatButton(
//             color: Colors.white,
//               textColor: Colors.black,
//               onPressed: (){
//                 Navigator.pushReplacement(context, createRoute(Home()));
//               },
//               child: Text("Enter"))
//         ],
//       ),
//       ),
//       ),
//     );
//   }
//
// }