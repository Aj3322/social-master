import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class signupController extends GetxController{
  static signupController get instance=> Get.find();
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  final password = TextEditingController();

  // void registerUser(String email , String passward){
  //   AuthenticationRepotry.instance.CreateUserWithEmailAndPssward(email, passward);
  //
  // }

}