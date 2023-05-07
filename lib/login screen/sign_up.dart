import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/fun/auth.dart';
import 'package:social/fun/upload_img.dart';
import 'package:social/login%20screen/login.dart';
import 'package:social/ui/page1.dart';
import 'control.dart';
import 'package:get/get.dart';
class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  final password = TextEditingController();
  Uint8List? _image;
  bool _isLoading =false;

  @override
  void dispose(){
    super.dispose();
    email.dispose();
    password.dispose();
    bio.dispose();
  }
  void selectImage()async{
    setState(() {
      _isLoading = true;
    });
     Uint8List? im = await pickImage(ImageSource.gallery);
     setState(() {
       _image=im;

     });
  }



  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(width: 100,
                  height: 200,
                ),
                Container(
                  child: Text(
                    "Sign up",

                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                Stack(
                  children: [
                    _image!= null? CircleAvatar(
                radius: 64,
                  backgroundImage: MemoryImage(_image!)
                )
                   : CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage("assets/Screenshot 2023-04-14 224825.jpg"),
                    ),
                    Positioned(
                      bottom: -10,
                        left: 80,
                        child:IconButton(

                      icon: Icon(Icons.add_a_photo),
                      onPressed: selectImage,
                    ))
                  ],
                  
                ),
                SizedBox(height:30 ,),
                Container(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: name ,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.person),
                      labelText: "enter user name",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),

                  ),

                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: email,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.mail),
                      labelText: "Email",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                ), SizedBox(
                  height: 30,
                ),

                Container(
                  width: 300,
                  height: 40,

                  child: TextField(
                     controller: bio,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.date_range_outlined),
                      labelText: "bio",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),

                  ),

                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  width: 300,
                  height: 40,

                  child: TextField(
                        controller: password,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.lock_sharp),
                      labelText: " create password",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    obscureText: true,
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: ()async{
                  String res = await AuthMethod().SignUpUser(email: email.text,
                    passward: password.text,
                    username: name.text,
                    bio: bio.text,

                );
                  print(res);

                  },
                    child: Text("Sign up")),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
