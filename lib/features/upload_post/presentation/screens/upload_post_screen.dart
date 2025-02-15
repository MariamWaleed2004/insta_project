import 'package:clean_arch_pro/core/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadPostScreen extends StatelessWidget {
  const UploadPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backGroundColor,
      body: 
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: secondaryColor.withValues(alpha: .3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.upload, color: primaryColor, size: 40,),
              ),
            ),
          ),
     
    );
  }
}