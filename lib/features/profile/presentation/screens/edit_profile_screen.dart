import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/profile/presentation/widgets/profile_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          'Edit Profile',
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, size: 32,)),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.done, color: blueColor, size: 32,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              sizeVer(15),
              Center(
                child: Text(
                  "Change profile photo",
                  style: 
                  TextStyle(
                    color: blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Name",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Username",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Website",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Bio",
              ),
            ],
          ),
        ),
      ),
    );
  }
}