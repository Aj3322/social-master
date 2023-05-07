import 'package:flutter/material.dart';
class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",
          style: TextStyle(
            fontSize: 30
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical ,
        child: Container(
          child: Column(


            children: [
             Row(
               children: [


                      CircleAvatar(
                       radius: 40,
                       backgroundImage: AssetImage("assets/Screenshot 2023-04-21 095058.png"),
                     ),
                  SizedBox(
                    width: 20,
                  ),

                 Container(
                   width: 200,
                   child: Text("Follow Request",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20
                     ),
                   ),
                 )




               ],
             ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("TODAYS",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/480584e3-d1da-420a-ad37-e0de81a09993.jpg"),
                  ),
                  SizedBox(width: 10,),
                  Container(
                      width: 160,
                    child: Text(
                      "Kanika123 requested you to follow",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},

                        child: Text(
                          "Confirm",
                              style: TextStyle(
                                fontSize: 7
                              ),
                        ) ),
                  ),
                  SizedBox(width: 5,),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10
                        ),

                        child: Text(
                          "delete",
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ) ),
                  ),


            ],
          ) ,
              SizedBox(height: 30,width: double.infinity,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/er.jpg"),
                  ),
                  SizedBox(width: 20,
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    child: Text(
                      "PEAral_34 liked your story",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,


                  ),
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage("assets/images (17).jpeg"),
                        fit: BoxFit.fill

                    )
                    ),
                  ),




                ],
              ),
              SizedBox(width: double.infinity,
                height: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/wer.jpg"),
                  ),
                  SizedBox(width: 20,
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    child: Text(
                      "Aral_34 liked your story",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,


                  ),
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/photo-1618588507085-c79565432917.jpg"),
                            fit: BoxFit.fill

                        )
                    ),
                  ),





                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("This Week",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/img.jpg"),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    child: Text(
                      "nika12 requested you to follow",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},

                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              fontSize: 7
                          ),
                        ) ),
                  ),
                  SizedBox(width: 5,),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10
                        ),

                        child: Text(
                          "delete",
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ) ),
                  ),

                ],
              ) ,
              SizedBox(height: 20,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images (2).jpg"),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    child: Text(
                      "tanya_3 requested you to follow",

                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},

                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              fontSize: 7
                          ),
                        ) ),
                  ),
                  SizedBox(width: 5,),
                  SizedBox(
                    width: 60,
                    height: 20,

                    child: ElevatedButton(onPressed:(){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10
                        ),

                        child: Text(
                          "delete",
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ) ),
                  ),

                ],
              ) ,
              SizedBox(width: double.infinity,
                height: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/download.jpg"),
                  ),
                  SizedBox(width: 20,
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    child: Text(
                      "rahul_ahrma liked your story",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,


                  ),
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/images (1).jpg"),
                            fit: BoxFit.fill

                        )
                    ),
                  ),





                ],
              ),
              SizedBox(width: double.infinity,
                 height: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/adebfbf2-4b4e-4f79-9457-3634e23b5bc4.jpg"),
                  ),
                  SizedBox(width: 20,
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    child: Text(
                      "ram_shrma liked your story",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,


                  ),
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/download.jpg"),
                            fit: BoxFit.fill

                        )
                    ),
                  ),






                ],
              ),
              SizedBox(width: double.infinity,
                height: 30,

              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/er.jpg"),
                  ),
                  SizedBox(width: 20,
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    child: Text(
                      "rina liked your story",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,


                  ),
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/download.jpg"),
                            fit: BoxFit.fill

                        )
                    ),
                  ),





                ],
              ),



            ] ),
      ),
    ));
  }
}
