import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/fun/storage.dart';
import 'package:social/fun/upload_img.dart';
import 'package:social/ui/notify.dart';
import 'package:social/ui/search%20page.dart';
import 'package:uuid/uuid.dart';
import 'home_page.dart';
import 'profile.dart';
class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  int currentIndex=0;
  Uint8List? _image;
  final screens =[
    
    home_pg(),
    search(),
    // Center(child: Text("add", style: TextStyle(color: Colors.white),),),
    notification(),
    ProfileScreen(

    ),

  ];
  @override
  void selectImage()async{
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image=im;

    });
  }
  Widget build(BuildContext context) {



    return Scaffold(

      backgroundColor: Colors.black,

      body:
      screens[currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: currentIndex,
         onTap: (index)=>setState(() {currentIndex= (index);

         }),
         unselectedItemColor: Colors.grey,
         selectedItemColor: Colors.white,
         showSelectedLabels: false,
         showUnselectedLabels: false,
         items: [BottomNavigationBarItem
           (icon: Icon(Icons.home,

         ),
           label: "home",
           backgroundColor: Colors.black ,

         ),
           BottomNavigationBarItem
             (icon: Icon(Icons.search,

           ),
               label: "search",
             backgroundColor: Colors.black ,
           ),
           // BottomNavigationBarItem
           //   (icon: Icon(Icons.add,
           //
           // ),
           //     label: "add",
           //   backgroundColor: Colors.black ,
           // ),
           BottomNavigationBarItem
             (icon: Icon(Icons.favorite_border,

           ),
               label: "notification",
             backgroundColor: Colors.black ,
           ),
           BottomNavigationBarItem
             (icon: Icon(Icons.person,

           ),
               label: "profile",
             backgroundColor: Colors.black ,
           ),


         ],
       ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()  {

        },
        backgroundColor: Colors.white,
        mini: true,
        tooltip: 'add',
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
