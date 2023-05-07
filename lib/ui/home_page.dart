import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';
import 'package:social/ui/post_card.dart';

import '../fun/storage2.dart';
import '../fun/upload_img.dart';

class home_pg extends StatefulWidget {
  const home_pg({Key? key}) : super(key: key);

  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.10,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 90,
                        height: 100,
                        color: Colors.white10,
                        child:
                        IconButton(
                          icon: Icon(Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: (){},
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/adebfbf2-4b4e-4f79-9457-3634e23b5bc4.jpg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/480584e3-d1da-420a-ad37-e0de81a09993.jpg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.71,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .orderBy('datePublished', descending: true)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => PostCard(
                          snap: snapshot.data!.docs[index].data(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
