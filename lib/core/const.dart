import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const backGroundColor = Color.fromRGBO(0, 0, 0, 1.0);
const primaryColor = Colors.white;
const primaryColorFilter = ColorFilter.mode(Colors.white, BlendMode.srcIn);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const secondaryColor = Colors.grey;
const darkGreyColor =  Color.fromRGBO(97, 97, 97, 1);

Widget sizeVer(double height) {
  return SizedBox(height: height,);
}

      
Widget sizeHor(double width) {
  return SizedBox(width: width);
}

class ScreenConst {
  static const String editProfileScreen = 'editProfileScreen';
  static const String updatePostScreen = 'updatePostScreen';
  static const String commentScreen = 'commentScreen';
  static const String signInScreen = 'signInScreen';
  static const String signUpScreen = 'signUpScreen';

}


class FirebaseConst {
  static const String users = 'users';
  static const String posts = 'posts';
  static const String comments = 'comments';
  static const String replay = 'replay';

}



void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: blueColor,
      textColor: Colors.white,
      fontSize: 16.0);
}