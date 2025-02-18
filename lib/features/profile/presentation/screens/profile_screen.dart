import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {

  final UserEntity currentUser;

  const ProfileScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
      backgroundColor: backGroundColor,
        title: Text('${currentUser.username}', style: TextStyle(color: primaryColor),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                _openBottomModelSheet(context);
              },
              child: Icon(Icons.menu, color: primaryColor,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,  vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: profileWidget(imageUrl: currentUser.profileUrl),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('${currentUser.totalPosts}', style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                      sizeVer(8),
                      Text('Posts', 
                      style: TextStyle(color: primaryColor),),
                        ],
                      ),
                      sizeHor(25),
                       Column(
                        children: [
                          Text('${currentUser.totalFollowers}', style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                      sizeVer(8),
                      Text('Followers', 
                      style: TextStyle(color: primaryColor),),
                        ],
                      ), 
                      sizeHor(25),
                      Column(
                        children: [
                          Text('${currentUser.totalFollowers}', style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                      sizeVer(8),
                      Text('Following', 
                      style: TextStyle(color: primaryColor),),
                        ],
                      )
                    ],
                  )
                ],
              ),
              sizeVer(10), 

              Text('${currentUser.name == "" ? currentUser.username : currentUser.name}', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),), 
              sizeVer(10),  

              Text('${currentUser.bio}', style: TextStyle(color: primaryColor,),),
              sizeVer(10), 
              
              GridView.builder(
                    itemCount: 33,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing:  5,
                      ), 
                    itemBuilder: (context,  index) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: secondaryColor,
                     );
                  },
               ), 
            ],
          ),
        ),
      ),
    );
  }

  _openBottomModelSheet(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 150,
        decoration: BoxDecoration(
          color: backGroundColor.withOpacity(.8),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(left: 10, top: 7),
                child: Text(
                  'More Options',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: primaryColor,
                  ),
                ),
                ),
                sizeVer(2),
                Divider(
                  thickness: 1,
                  color: secondaryColor,
                ),
                sizeVer(5),
                Padding(padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ScreenConst.editProfileScreen, arguments: currentUser);
                    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => EditProfileScreen()));
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                ),
                sizeVer(2),
                Divider(
                  thickness: 1,
                  color: secondaryColor,
                ),
                sizeVer(5),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthCubit>(context).loggedOut();
                      Navigator.pushNamedAndRemoveUntil(context, ScreenConst.signInScreen, (route) => false);
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.w500, 
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  ),
                  sizeVer(5),
              ],
            ),
          ),
        ),
      );
    });
  }

}