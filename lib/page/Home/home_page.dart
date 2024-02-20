import 'package:flutter/material.dart';
import 'package:appschedule/page/Home/Widgets/home_schedule_icon.dart';

class HomePafe extends StatelessWidget{
  const HomePafe({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: //MyWidget(),
      Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children:<Widget> [
            Container(
              color: Colors.white,
            ),
            Container(
              height: 200,
              color: Colors.amber,
              child: const Row(children: [
                Icon(
                  Icons.arrow_left,
                  size: 40,
                  color: Colors.white,
                  ),
                Expanded(
                  child: Text(
                    'Date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Times New Roman',
                    ),
                    ),
                )
              ]),
            ),
            const Positioned(
              top: 140,
              child: HomeScheduleIcon(),
            ),
          ],
        ),
        ),
    );
  }
}

// class MyWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return  Stack(
//       children: [
//         Container(
//           color: Colors.white,
//         ),
//         Container(
//           color: Colors.amber,
//           width: double.infinity,
//           height: 200,
//           child: const Row(
//             children: [
//               Icon(
//                 Icons.arrow_left,
//                 size: 35,
//                 color: Colors.white,
//                 ),
//               SizedBox(width: 30),
//               Text(
//                 'Date',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//                 ),
              
//             ],
//           ),
//         ),
//         Positioned(
//           left: 10,
//           bottom: 10,
//           child: Container(
//             child: const Column(
//               children: [
//                 HomeScheduleIcon(),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }