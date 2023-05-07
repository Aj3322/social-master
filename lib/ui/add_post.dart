import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/fun/fire.dart';

import '../fun/auth.dart';
import '../fun/upload_img.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading=false;
  var userData = {};
  var user ={};

  final TextEditingController _discriptionControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text('Create a post'),
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: Text('Take a Photo'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera);
              setState(() {
                _file=file;
              });
            },
          ),

          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: const Text('Choose from gallery'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery);
              setState(() {
                _file=file;
              });
            },
          ),

          SimpleDialogOption(

            padding: EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  void postImage(
      String username,
      String uid,
      String profileImage,
      ) async {

    if(_file!=null){
      setState(() {
        isLoading=true;
      });
      try {
        String res = await FireStoreMethods().uploadPost(
            _discriptionControler.text, _file!,  uid,username, profileImage);

        if (res == 'Success') {
          setState(() {
            isLoading=false;
          });
          showSnakBar("posted", context);
          clearImage();
        }else{
          setState(() {
            isLoading=false;
          });
          showSnakBar(res, context);
        }
      }catch(err){
        setState(() {
          isLoading=false;
        });
        showSnakBar(err.toString(), context);
      }
      Navigator.of(context).pop();
    }


  }

  void clearImage(){

    if(_file==null){
      Navigator.of(context).pop();
    }
    setState(() {
      _file=null;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _discriptionControler.dispose();
  }

  getData() async {
    log(FirebaseAuth.instance.currentUser!.uid.toString());
    setState(() {
      isLoading=true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      user = userSnap.data()!;
    } catch (e) {
      showSnakBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
          onPressed: clearImage,
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Text('Post to',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => postImage( user['username'], user['uid'],user['photourl']),
            child: const Text('Post', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16,),),
          ),
        ],
      ),
      body: _file==null? Center(
        child: IconButton(
          onPressed: () => _selectImage(context) ,
          icon: const Icon(Icons.upload , size: 54,color: Colors.white,),
        ),
      ):Column(
        children: [
          isLoading? const  LinearProgressIndicator(): const Padding(padding: EdgeInsets.only(top: 0),),const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    user['photourl']??''
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _discriptionControler,
                  decoration: const InputDecoration(
                    hintText: 'Write a caption',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 481/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      ),

    );
  }
}