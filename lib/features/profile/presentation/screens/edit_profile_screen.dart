import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/profile_widget.dart';
import 'package:clean_arch_pro/features/profile/presentation/widgets/profile_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final UserEntity currentUser;
  const EditProfileScreen({
    super.key,
    required this.currentUser,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? _nameController;
  TextEditingController? _usernameController;
  TextEditingController? _websiteController;
  TextEditingController? _bioController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.currentUser.name);
    _usernameController =
        TextEditingController(text: widget.currentUser.username);
    _websiteController =
        TextEditingController(text: widget.currentUser.website);
    _bioController = TextEditingController(text: widget.currentUser.bio);
    super.initState();
  }

  bool _isUpdating = false;

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
            child: Icon(
              Icons.close,
              size: 32,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: _updateUserProfile,
              child: Icon(
                Icons.done,
                color: blueColor,
                size: 32,
              ),
            ),
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
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child:
                        profileWidget(imageUrl: widget.currentUser.profileUrl),
                  ),
                ),
              ),
              sizeVer(15),
              Center(
                child: Text(
                  "Change profile photo",
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Name",
                controller: _nameController,
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Username",
                controller: _usernameController,
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Website",
                controller: _websiteController,
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Bio",
                controller: _bioController,
              ),
              sizeVer(10),
              _isUpdating == true? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please wait...", style: TextStyle(color: Colors.white),),
                  sizeHor(10),
                  CircularProgressIndicator(),
                ],
              ) : Container(width: 0, height: 0),
            ],
          ),
        ),
      ),
    );
  }
  _updateUserProfile() {
    try {
      setState(() {
      _isUpdating = true;
    });
  BlocProvider.of<UserCubit>(context).updateUser(
    user: UserEntity(
      uid: widget.currentUser.uid,
      username: _usernameController!.text,
      name: _nameController!.text,
      bio: _bioController!.text,
      website: _websiteController!.text,
     )
    ).then((value) => _clear());
  
    } catch (e) {
      setState(() {
        _isUpdating = false;
      });
      toast("updating user failed. Please try again.");
    }
  } 

  _clear() {
    setState(() {
      _isUpdating = false;
      _usernameController!.clear();
      _nameController!.clear();
      _bioController!.clear();
      _websiteController!.clear();
    });
    Navigator.pop(context);
  }
}


