import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarProfile extends StatelessWidget{
  const AvatarProfile({super.key});
  @override
  Widget build(BuildContext context){
    return  Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
              CircleAvatar(
                backgroundColor:  Colors.white,
                radius: 60,
                // child: CircleAvatar(
                //   radius: 50,
                //   backgroundImage: AssetImage('assets/images/schedule/avatar.jpeg'),
                // ),
                child: IconButton(
                  onPressed: (){}, 
                  icon: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: 'https://reqres.in/img/faces/5-image.jpg',
                        width: 100,
                        height: 100,
                        fit:BoxFit.fitHeight,
                        placeholder: (context, url) => const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 150,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black12,
                          child: const Icon(Icons.error, color: Colors.red, size: 15,), 
                          ),
                        ),
                    ),
                  )
              ),
              const SizedBox(height: 10,),
              const Text(
                'Thanh Tung',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 28,
                  fontWeight:FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Developer Flutter ',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight:FontWeight.normal,
                  color: Colors.white,
                ),
              ),
        ],
      ),
    );
  }
}