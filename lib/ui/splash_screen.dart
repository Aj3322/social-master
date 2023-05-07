import 'package:flutter/material.dart';
import 'package:social/login%20screen/login.dart';
import 'package:social/ui/page1.dart';
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @ override
  void initState(){
    super.initState();
    navigateToHome();

  }
  navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context)=>login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images (17).jpeg"),
                fit: BoxFit.cover,
              )
          ),

          child:
          Text(
            "Instagram",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,

            ),

          ),

        ),

      ),
    );
  }
}
