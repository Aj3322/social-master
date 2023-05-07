import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

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
      Stack(
        children: [
          Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54
            ),
            child:TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: ("search post"),
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal
                ),

                prefixIcon: Icon(Icons.search,
                  color: Colors.white,
                )
              ),
              onFieldSubmitted: (String _) {
                setState(() {
                  isShowUsers = true;
                });
                print(_);
              },
            ) ,
          ),
       Padding(
         padding: const EdgeInsets.only(top: 55),
         child: Container(
           child:  isShowUsers
               ? FutureBuilder(
             future: FirebaseFirestore.instance
                 .collection('users')
                 .where(
               'username',
               isGreaterThanOrEqualTo: searchController.text,
             ).get(),
             builder: (context, snapshot) {
               if (!snapshot.hasData) {
                 return const Center(
                   child: CircularProgressIndicator(),
                 );
               }
               return ListView.builder(
                 itemCount: (snapshot.data! as dynamic).docs.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     leading: CircleAvatar(
                       backgroundImage: NetworkImage(
                         (snapshot.data! as dynamic).docs[index]['photourl'],
                       ),
                       radius: 22,
                     ),
                     title: Text(
                       (snapshot.data! as dynamic).docs[index]['username'],style: const TextStyle(color: Colors.white),
                     ),
                     subtitle:Text((snapshot.data! as dynamic).docs[index]['bio'],style: TextStyle(color: Colors.white),),
                   );
                 },
               );
             },
           )
               :
           Container(
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [Container(
                       width: 120,
                       height: 200,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           image: DecorationImage(
                               image: AssetImage("assets/images (1).jpg"),
                               fit: BoxFit.fill

                           )

                       ),
                     ),
                       SizedBox(width: 10,),
                       Container(
                         width: 210,
                         height: 200,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                                 image: AssetImage("assets/photo-1618588507085-c79565432917.jpg"),
                                 fit: BoxFit.fill

                             )

                         ),
                       ),

                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [Container(
                       width: 120,
                       height: 200,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           image: DecorationImage(
                               image: AssetImage("assets/480584e3-d1da-420a-ad37-e0de81a09993.jpg"),
                               fit: BoxFit.fill

                           )

                       ),
                     ),
                       SizedBox(width: 10,),
                       Container(
                         width: 210,
                         height: 200,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                                 image: AssetImage("assets/wer.jpg"),
                                 fit: BoxFit.fill

                             )

                         ),
                       ),

                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [Container(
                       width: 120,
                       height: 200,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           image: DecorationImage(
                               image: AssetImage("assets/download.jpg"),
                               fit: BoxFit.fill

                           )

                       ),
                     ),
                       SizedBox(width: 10,),
                       Container(
                         width: 210,
                         height: 200,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                                 image: AssetImage("assets/images (17).jpeg"),
                                 fit: BoxFit.fill

                             )

                         ),
                       ),

                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       )

        ],
      )
      );

  }
}
