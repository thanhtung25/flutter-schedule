// import 'package:appschedule/api_localhost/ApiSchedule.dart';
// import 'package:appschedule/api_localhost/Futuru_Api.dart';
// import 'package:appschedule/fire_base/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class HomeList extends StatefulWidget{
//   const HomeList ({super.key});

//   @override
//   State<HomeList> createState() => _HomeListState();
// }

// class _HomeListState extends State<HomeList> {
//   //
//   Stream? EmployeeStream;

//   getintheload() async{
//     EmployeeStream = await DatabaseMethods().getDetails();
//     setState(() {
      
//     });
//   }
//   Widget allDetails(){
//     return StreamBuilder(
//       stream: EmployeeStream, 
//       builder: (context, AsyncSnapshot snapshot){
//         return snapshot.hasData? ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot ds = snapshot.data.docs[index];
//             return Padding(
//         padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 20),
//         child: Row(
//           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: 30,
//               height: 30,
//               decoration:BoxDecoration(
//                 color:const Color(0xffFF9E74),
//                 borderRadius: BorderRadius.circular(50)
//               ),
//               child:  Text(
//                 (index+1).toString(),
//                 textAlign:TextAlign.center,
//                 style:const TextStyle(
//                   color: Colors.white,
//                   fontFamily: "Times New Roman",
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 30,),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color:  const Color(0xffFFDEE8),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: const [
//                     BoxShadow(color: Color.fromARGB(255, 242, 183, 242), spreadRadius:0 , blurRadius:10,offset: Offset(0.0, 5.0))
//                   ]
//                 ),
//                 child:  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: 10,
//                       decoration: const BoxDecoration
//                       (
//                         color: Color(0xffFF95B6),
//                         borderRadius: BorderRadius.horizontal(left:Radius.circular(20)),
//                       ),
                      
//                     ),
//                      Padding(
//                       padding:const EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.punch_clock_sharp, color: Color.fromARGB(255, 251, 83, 136), ),
//                               const SizedBox(width: 20,),
//                               Text(
//                                 ds["FromTime"],
                                
//                                 style:const TextStyle(
//                                   fontFamily: "Times New Roman",
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 251, 83, 136)
//                                 ),
//                               ),
//                               const Text(
//                                 ' - ',
//                                 style: TextStyle(
//                                   fontFamily: "Times New Roman",
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 251, 83, 136)
//                                 ),
//                                 ),
//                               Text(
//                                 ds["ToTime"],
//                                 style: const TextStyle(
//                                   fontFamily: "Times New Roman",
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 251, 83, 136)
//                                 ),
//                                 ),
                              
//                             ],
//                           ),
                      
//                           Padding(
//                             padding:const EdgeInsets.only(top: 8.0),
//                             child: Row(
//                               children: [
//                                 const Icon(Icons.touch_app,color: Color(0xffFF95B6),),
//                                 const SizedBox(width: 20,),
//                                 Text(
//                                   ds["Title"],
//                                   style:const TextStyle(
//                                     fontFamily: "Times New Roman",
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.normal,
//                                     color: Color(0xffFF95B6),
//                                   ),
//                                   )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     IconButton(
//                                 onPressed: ()async {
//                                   await DatabaseMethods().DeleteDetail(ds["Id"]);
//                                 }, icon: (const Icon(Icons.delete, color: Color.fromARGB(255, 251, 83, 136)))
//                               )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//           },
//           ): Container();
//       }
//     );
//   }
//   //
//   // NoteService service = NoteService();
//   // List<ApiSchedule>? notes;
//   // var isloaded = false;
//   @override
//   void initState() {
//     getintheload();
//     super.initState();
//     //getData();
    
//   }
//   // void getData() async{
//   //   notes = await NoteService().getNotesList();
//   //   if(notes != null){
//   //     setState(() {
//   //       isloaded = true;
//   //     });
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context){
//   //   return FutureBuilder(
//   //     future: service.getNotesList(), 
//   //     builder: ( context, snapshot){
//   //       if(snapshot.hasData){
//   //         return ListView.separated(
//   //           itemBuilder: (context, index){
//   //             return Padding(
//   //       padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 20),
//   //       child: Row(
//   //         mainAxisAlignment:MainAxisAlignment.spaceBetween,
//   //         children: [
//   //           Container(
//   //             alignment: Alignment.center,
//   //             width: 30,
//   //             height: 30,
//   //             decoration:BoxDecoration(
//   //               color:const Color(0xffFF9E74),
//   //               borderRadius: BorderRadius.circular(50)
//   //             ),
//   //             child:  Text(
//   //               notes![index].id.toString(),
//   //               textAlign:TextAlign.center,
//   //               style:const TextStyle(
//   //                 color: Colors.white,
//   //                 fontFamily: "Times New Roman",
//   //                 fontSize: 18,
//   //                 fontWeight: FontWeight.w700,
//   //               ),
//   //             ),
//   //           ),
//   //           const SizedBox(width: 30,),
//   //           Expanded(
//   //             child: Container(
//   //               decoration: BoxDecoration(
//   //                 color:  const Color(0xffFFDEE8),
//   //                 borderRadius: BorderRadius.circular(20),
//   //                 boxShadow: const [
//   //                   BoxShadow(color: Color.fromARGB(255, 242, 183, 242), spreadRadius:0 , blurRadius:10,offset: Offset(0.0, 5.0))
//   //                 ]
//   //               ),
//   //               child:  Row(
//   //                 children: [
//   //                   Container(
//   //                     width: 10,
//   //                     decoration: const BoxDecoration
//   //                     (
//   //                       color: Color(0xffFF95B6),
//   //                       borderRadius: BorderRadius.horizontal(left:Radius.circular(20)),
//   //                     ),
                      
//   //                   ),
//   //                    Padding(
//   //                     padding:const EdgeInsets.all(10.0),
//   //                     child: Column(
//   //                       children: [
//   //                         Row(
//   //                           children: [
//   //                             const Icon(Icons.punch_clock_sharp ),
//   //                             const SizedBox(width: 20,),
//   //                             Text(
//   //                               notes![index].fromTime,
//   //                               style:const TextStyle(
//   //                                 fontFamily: "Times New Roman",
//   //                                 fontSize: 20,
//   //                                 fontWeight: FontWeight.normal,
//   //                               ),
//   //                             ),
//   //                             const Text(
//   //                               ' - ',
//   //                               style: TextStyle(
//   //                                 fontFamily: "Times New Roman",
//   //                                 fontSize: 20,
//   //                                 fontWeight: FontWeight.normal,
//   //                               ),
//   //                               ),
//   //                             Text(
//   //                               notes![index].toTime,
//   //                               style: const TextStyle(
//   //                                 fontFamily: "Times New Roman",
//   //                                 fontSize: 20,
//   //                                 fontWeight: FontWeight.normal,
//   //                               ),
//   //                               )
//   //                           ],
//   //                         ),
                      
//   //                         Padding(
//   //                           padding:const EdgeInsets.only(top: 8.0),
//   //                           child: Row(
//   //                             children: [
//   //                               const Icon(Icons.touch_app,color: Color(0xffFF95B6),),
//   //                               const SizedBox(width: 20,),
//   //                               Text(
//   //                                 notes![index].title,
//   //                                 style:const TextStyle(
//   //                                   fontFamily: "Times New Roman",
//   //                                   fontSize: 20,
//   //                                   fontWeight: FontWeight.normal,
//   //                                   color: Color(0xffFF95B6),
//   //                                 ),
//   //                                 )
//   //                             ],
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //           }, 
//   //           separatorBuilder:  (context , index){
//   //             return const Padding(
//   //               padding: EdgeInsets.only(left: 20, right: 20),
//   //               child: Divider(
//   //                 color: Colors.amber,
//   //               ),
//   //             );
//   //           }, 
//   //           itemCount: notes!.length
//   //         );
//   //       }else{
//   //         return const Center(child: CircularProgressIndicator(),);
//   //       }
//   //     }
//   // );
//   return Container(
//     child: allDetails(),
//   );
// }

// }
