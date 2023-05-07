import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:social/fun/fire.dart';

import '../fun/auth.dart';
class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key, required this.snap,}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating=false;
  final TextEditingController commentEditingController = TextEditingController();
  var myUid=FirebaseAuth.instance.currentUser!.uid;

  deletePost(String postId) async {
    try {
      // await FirestoreMethods().deletePost(postId);
    } catch (err) {
      showSnakBar(
        err.toString(),
        context,
      );
    }
  }
  //
  //
  // void postComment(String uid, String name, String profilePic) async {
  //   try {
  //     String res = await FirestoreMethods().postComment(
  //       widget.snap['postId'].toString(),
  //       commentEditingController.text,
  //       uid,
  //       name,
  //       profilePic,
  //       widget.snap['uid'].toString(),
  //       '',
  //     );
  //
  //     if (res != 'success') {
  //       showSnakBar( res,context,);
  //     }
  //     setState(() {
  //       commentEditingController.text = "";
  //     });
  //   } catch (err) {
  //     showSnakBar(
  //       err.toString(),
  //       context,
  //     );
  //   }
  // }
  void likepost()async{
    await FireStoreMethods().likePost(widget.snap['postId'],FirebaseAuth.instance.currentUser!.uid.toString(), widget.snap['likes']);
    setState(() {
      isLikeAnimating = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    // final Users user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color:Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(widget.snap['profImage']),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap['username'],
                          style: const TextStyle(
                            fontSize: 20,
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                widget.snap['uid'].toString() == myUid?
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: ['Delete']
                                .map(
                                  (e) => InkWell(
                                onTap: () {deletePost(
                                  widget.snap['postId']
                                      .toString(),
                                );
                                // remove the dialog box
                                Navigator.of(context).pop();},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Text(e),
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ));
                  },
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    color: Color(0xFFD4BEC1),
                  ),
                )
                    :Container(),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      constraints:BoxConstraints(
                        minHeight: 100,
                        maxHeight: MediaQuery.of(context).size.height  * 0.4,
                      ),
                      width:width*0.90,
                      child: Image.network(
                        widget.snap['postUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: likepost,
                      child: Container(
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
                                '${widget.snap['likes'].length}',
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 30,),
                    Container(
                      child: IconButton(
                        color: Colors.white, onPressed: () { likepost();}, icon: Icon(Icons.insert_comment_rounded),
                      ),

                    ),
                    Container(child: Text("34",
                      style: TextStyle(color: Colors.white),

                    ),),
                    SizedBox(width: 20,),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}