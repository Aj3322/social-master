import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social/login%20screen/login.dart';

import '../fun/auth.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override

  var userData = {};
  String postData = '';
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading=true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo:FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      log(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }


  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(' sign out?'),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('SIGN OUT'),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>login()));

                // Code to sign out the user goes here
              },
            ),
          ],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:  Colors.black26,
        leading: Icon(Icons.lock_open),
        title: Text(userData['username']??'name'),
          actions: [
      IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {_showSignOutDialog(context);

        // Add your onPressed logic here
      }
    ),]
     ),
      body:isLoading?CircularProgressIndicator(): SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
            children: [
        Container(
        child: Container(
          color: Colors.black,

          child: CircleAvatar(
            backgroundColor: Colors.deepPurple,

            radius: 50,
            child: ClipOval(
              child: SizedBox(
                child: Image(
                  width: 90,
                  height: 90,
                  image: NetworkImage(userData['photourl']),
                  fit: BoxFit.fill,
                ),
              ),
            ),

          ),
        ),
        ),
              SizedBox(width: 40,),
              Container(child: Text(postLen.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text(followers.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text(following.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),),
            ],
          ),
            Row(children: [SizedBox(width: 140,),
              Container(child: Text("post",style: TextStyle(fontSize: 10,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text("follower",style: TextStyle(fontSize: 10,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text("following",style: TextStyle(fontSize: 10,color: Colors.white),),),],),
            SizedBox(height: 30,),
            SizedBox(
              width: 400,
              child: ElevatedButton(onPressed: (){}, child: Text("edit profile"),style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
              ),),
            ),
            SizedBox(height: 40,),
            Center(
              child: BottomNavigationBar(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded,),
                  label: 'post',
                ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_camera_outlined,),
                    label: 'camera',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.tag,),
                    label: 'taged',
                  ),
                ]
              ),
            )
          ],
        ),),

      ),

    );
  }
}
