import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';

import '../fun/storage2.dart';
import '../fun/upload_img.dart';
class home_pg extends StatefulWidget {
  const home_pg({Key? key}) : super(key: key);

  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Instagram",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white
          ),
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
      body:

           SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [Row(
                  children: [Container(
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
                  SizedBox(
                  height: 30,
                  ),
                  Column(
                    children: [
                      Row(

                        children: [
                          Container(
                            child: Container(
                              color: Colors.black,

                              child: CircleAvatar(
                                backgroundColor: Colors.deepPurple,

                                radius: 20,
                                child: ClipOval(
                                  child: SizedBox(
                                    child: Image(
                                      width: 90,
                                      height: 90,
                                      image: AssetImage("assets/img.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: Text("kanika123",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                            ),
                          ),
                          SizedBox(width: 130,),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.more_horiz,
                                color: Colors.white,
                              ),
                              onPressed: (){},
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 300,
                        height: 200,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/photo-1618588507085-c79565432917.jpg"),
                                fit: BoxFit.fill

                            )

                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child:
                            LikeButton(
                              size: 20,
                              circleColor:
                              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Color(0xff33b5e5),
                                dotSecondaryColor: Color(0xff0099cc),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color: isLiked ? Colors.red : Colors.grey,
                                  size: 20,
                                );
                              },
                              likeCount: 0,
                              countBuilder: (int? count, bool isLiked, String text) {
                                var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                Widget result;
                                if (count == 0) {
                                  result = Text(
                                    "like",
                                    style: TextStyle(color: color),
                                  );
                                } else
                                  result = Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                return result;
                              },
                            ),
                          ),

                          SizedBox(width: 70,),
                          Container(
                            child: Icon(Icons.insert_comment_rounded,
                              color: Colors.white,
                            ),

                          ),
                          Container(child: Text("34",
                            style: TextStyle(color: Colors.white),

                          ),),
                          SizedBox(width: 10,),
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "  comment..."
                              )
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              color: Colors.black,

                              child: CircleAvatar(
                                backgroundColor: Colors.deepPurple,

                                radius: 20,
                                child: ClipOval(
                                  child: SizedBox(
                                    child: Image(
                                      width: 90,
                                      height: 90,
                                      image: AssetImage("assets/download.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(

                              child: Text("Rahul_sharma",

                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            SizedBox(width: 130,),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.more_horiz,
                                  color: Colors.white,
                                ),
                                onPressed: (){},
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 300,
                    height: 200,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/images (2).jpg"),
                            fit: BoxFit.fill

                        )

                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child:
                        LikeButton(
                          size: 20,
                          circleColor:
                          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 20,
                            );
                          },
                          likeCount: 0,
                          countBuilder: (int? count, bool isLiked, String text) {
                            var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                "like",
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                        ),
                      ),

                      SizedBox(width: 70,),
                      Container(
                        child: Icon(Icons.insert_comment_rounded,
                          color: Colors.white,
                        ),

                      ),
                      Container(child: Text("20",
                        style: TextStyle(color: Colors.white),

                      ),),
                      SizedBox(width: 10,),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: "  comment..."
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(

                    children: [
                      Container(
                        child: Container(
                          color: Colors.black,

                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurple,

                            radius: 20,
                            child: ClipOval(
                              child: SizedBox(
                                child: Image(
                                  width: 90,
                                  height: 90,
                                  image: AssetImage("assets/images (1).jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Text("Rose_blast",

                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(width: 130,),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.more_horiz,
                            color: Colors.white,
                          ),
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 300,
                    height: 200,


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/er.jpg"),
                        fit: BoxFit.fill

                      )


                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child:
                        LikeButton(
                          size: 20,
                          circleColor:
                          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 20,
                            );
                          },
                          likeCount: 0,
                          countBuilder: (int? count, bool isLiked, String text) {
                            var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                "like",
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                        ),
                      ),

                      SizedBox(width: 70,),
                      Container(
                        child: Icon(Icons.insert_comment_rounded,
                          color: Colors.white,
                        ),

                      ),
                      Container(child: Text("100",
                        style: TextStyle(color: Colors.white),

                      ),),
                      SizedBox(width: 10,),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: "  comment..."
                            )
                        ),
                      )
                    ],
                  ),

                    ],
                  )





              ),
            ),
          );



  }
}
