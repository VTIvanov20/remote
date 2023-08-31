// // import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:movie_app/widgets/components/track_pad.dart';

// class TrackPadWrapper extends StatefulWidget {
//   @override
//   _TrackPadWrapperState createState() => _TrackPadWrapperState();
// }

// class _TrackPadWrapperState extends State<TrackPadWrapper> {
//   int x = 0;
//   int y = 0;

//   void updateCoordinates(int x, int y) {
//   // You can use x and y values here
//   print('Received coordinates: X=$x, Y=$y');
// }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         setState(() {
//           x += details.delta.dx as int;
//           y += details.delta.dy as int;
//         });
//       },
//       child: TrackPad(
//         onCoordinatesUpdated: updateCoordinates, // Pass the function as the callback
//       ),
//     );
//   }
// }
