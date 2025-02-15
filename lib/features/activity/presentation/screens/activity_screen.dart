import 'package:clean_arch_pro/core/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text('Activity', style: TextStyle(color: primaryColor),),
      ),
      
    );
  }
}