import 'package:flutter/material.dart';

class HomeList extends StatelessWidget{
  const HomeList ({super.key});
  @override
  Widget build(BuildContext context){
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context,index){
      return AspectRatio(
        aspectRatio: 2/1,
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration:BoxDecoration(
                  color:const Color(0xffFF9E74),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  '01',
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color:  const Color(0xffFFDEE8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Color.fromARGB(255, 242, 183, 242), spreadRadius:0 , blurRadius:10,offset: Offset(0.0, 5.0))
                    ]
                  ),
                  child:  Row(
                    children: [
                      Container(
                        width: 10,
                        decoration: const BoxDecoration
                        (
                          color: Color(0xffFF95B6),
                          borderRadius: BorderRadius.horizontal(left:Radius.circular(20)),
                        ),
                        
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.punch_clock_sharp ),
                                SizedBox(width: 20,),
                                Text(
                                  '10:00 AM',
                                  style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  ' - ',
                                  style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  ),
                                Text(
                                  '1 PM',
                                  style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  )
                              ],
                            ),
                        
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app,color: Colors.amber,),
                                  SizedBox(width: 20,),
                                  Text(
                                    'Business meeting',
                                    style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.amber,
                                    ),
                                    )
                                ],
                              ),
                            ),
                        
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app,color: Colors.pinkAccent,),
                                  SizedBox(width: 20,),
                                  Text(
                                    'Business meeting',
                                    style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.pinkAccent,
                                    ),
                                    )
                                ],
                              ),
                            ),
                        
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app,color: Colors.blue,),
                                  SizedBox(width: 20,),
                                  Text(
                                    'Business meeting',
                                    style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue,
                                    ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }, 
    separatorBuilder: (context , _)=> const SizedBox(height: 15,), 
    itemCount: 20);
  }
}