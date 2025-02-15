import 'package:clean_arch_pro/core/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:clean/injection_container.dart' as di;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          colorFilter: primaryColorFilter,
          height: 32,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              MdiIcons.facebookMessenger,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    sizeHor(10),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _openBottomModelSheet(context);
                    //Navigator.push(context, MaterialPageRoute(builder: (ctx) => UpdatePostScreen()));
                  },
                  child: Icon(Icons.more_vert)),
              ],
            ),
            sizeVer(10),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              color: secondaryColor,
            ),
            sizeVer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: primaryColor,
                    ),
                    sizeHor(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ScreenConst.commentScreen);
                        //Navigator.push(context, MaterialPageRoute(builder: (ctx) => CommentScreen()));
                      },
                      child: Icon(
                        FeatherIcons.messageCircle,
                        color: primaryColor,
                      ),
                    ),
                    sizeHor(10),
                    Icon(
                      FeatherIcons.send,
                      color: primaryColor,
                    ),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: primaryColor,
                ),
              ],
            ),
            sizeVer(10),
            Text(
                  '34 likes',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            sizeVer(10),
            Row(
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeHor(10),
                Text(
                  'some description',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            sizeVer(10),
            Text(
              'view all 10 comments',
              style: TextStyle(
                color: darkGreyColor,
              ),
            ),
            sizeVer(10),
             Text(
              '08/5/2022',
              style: TextStyle(
                color: darkGreyColor,
              ),
            ),
          ],
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
                child:  Text(
                    "Delete Post",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ScreenConst.updatePostScreen);
                      // Navigator.push(context, MaterialPageRoute(builder: (ctx) => UpdatePostScreen()));
                    },
                    child: Text(
                      'Update Post',
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
