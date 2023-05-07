import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/login%20screen/login.dart';
import 'package:social/ui/add_post.dart';
import 'package:social/ui/page1.dart';
import 'package:social/ui/profile.dart';
import 'package:social/ui/splash_screen.dart';
import '';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,


        home:StreamBuilder(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.active) {
             // Checking if the snapshot has any data or not
             if (snapshot.hasData) {
               // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
               return const HOME();
             } else if (snapshot.hasError) {
               return Center(
                 child: Text('${snapshot.error}'),
               );
             }
           }

           // means connection to future hasnt been made yet
           if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(
               child: CircularProgressIndicator(),
             );
           }

           return const HOME();
         },
       ),
    );
  }
}

