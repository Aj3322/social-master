import 'package:flutter/material.dart';
import 'package:social/fun/auth.dart';
import 'package:social/fun/upload_img.dart';
import 'package:social/login%20screen/sign_up.dart';
import 'package:social/ui/page1.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'control.dart';

class login extends StatefulWidget {

  const login({Key? key
  }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  final password = TextEditingController();
  bool _isLoading =false;


  @override
  void dispose(){
    super.dispose();
    email.dispose();
    password.dispose();
    bio.dispose();
  }
   void loginUser()async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().loginUser(username:name.text, email: email.text, passward:password.text);
    if(res=="some error"){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HOME()));

    }else{
      setState(() {
        _isLoading = false;
      });
        showSnakBar(res, context);
    }

   }


  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 100,
              height: 100,
            ),
            Container(
            child: Text(
              "Login",

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
            SizedBox(height:30 ,),
            Container(
              width: 300,
              height: 40,

             child: TextField(
               controller: name,


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
                controller:email,

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
                  labelText: "password",
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
                maxLength: 8,
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 100,),
                ElevatedButton(
                    onPressed:(){loginUser();},
                    child: _isLoading? const Center(child: CircularProgressIndicator(
                      color: Colors.white,
                    ),

                    ):
                    Text("login")),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>sign()),
                );},
                    child: Text("Sign up")),
              ],
            )

          ],
        ),
      ),
    );
  }
}

