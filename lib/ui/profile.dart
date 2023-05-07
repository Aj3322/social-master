import 'package:flutter/material.dart';
import 'package:social/login%20screen/login.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
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
        title: Text("kanika123"),
          actions: [
      IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {_showSignOutDialog(context);

        // Add your onPressed logic here
      }
    ),]
     ),
      body: SingleChildScrollView(
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
                  image: AssetImage("assets/img.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

          ),
        ),
        ),
              SizedBox(width: 40,),
              Container(child: Text("23",style: TextStyle(fontSize: 20,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text("53",style: TextStyle(fontSize: 20,color: Colors.white),),),
              SizedBox(width: 40,),
              Container(child: Text("73",style: TextStyle(fontSize: 20,color: Colors.white),),),
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
