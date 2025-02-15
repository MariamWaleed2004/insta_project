import 'dart:io';
import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/credential_cubit/credential_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/button_container_widget.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/form_container_widget.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/profile_widget.dart';
import 'package:clean_arch_pro/features/main_screen/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  bool _isSigningUp = false;
  bool _isUploading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  File? _image;

  Future selectImage() async {
    try {
      final pickedFile = await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);

      setState(() {
        if(pickedFile != null) {
          setState(() {
          _image = File(pickedFile.path);
          });
        } else {
          toast("no image selected");
          print("no image has been selected");
        }
      });

    } catch(e) {
      toast("some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: backGroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentailState) {
            if(credentailState is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if(credentailState is CredentialFailure) {
              setState(() {
                _isSigningUp = false;
              });
              toast('Invalid Email and Password');
            }
          },
          builder: (context, credentailState) {
            if(credentailState is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if(authState is Authenticated) {
                    return MainScreen(uid: authState.uid);
                  } else {
                    return _bodyWidget();
                  }
                },
                );
            }
            return _bodyWidget();
          },
        )
        );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
            flex: 2,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/ic_instagram.svg',
              colorFilter: primaryColorFilter,
            ),
          ),
          sizeVer(12),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(borderRadius: BorderRadius.circular(30),child: profileWidget(image: _image)),
                ),
                Positioned(
                  right: -10,
                  bottom: -15,
                  child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: blueColor,
                      )),
                ),
              ],
            ),
          ),
          sizeVer(20),
          FormContainerWidget(
            controller: _usernameController,
            hintText: 'Username',
          ),
          sizeVer(10),
          FormContainerWidget(
            controller: _emailController,
            hintText: 'Email',
          ),
          sizeVer(10),
          FormContainerWidget(
            controller: _passwordController,
            hintText: 'Password',
            isPasswordField: true,
          ),
          sizeVer(10),
          FormContainerWidget(
            controller: _bioController,
            hintText: 'Bio',
          ),
          sizeVer(10),
          ButtonContainerWidget(
            color: blueColor,
            text: 'Sign Up',
            onTapListener: () {
              _signUpUser();
            },
          ),
            sizeVer(8),
          _isSigningUp == true || _isUploading == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please wait',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizeHor(10),
                    CircularProgressIndicator(),
                  ],
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
          Divider(
            color: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ?",
                style: TextStyle(color: primaryColor),
              ),
              sizeHor(8),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ScreenConst.signInScreen, (route) => false);
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => SignInScreen()), (route) => false);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
        
        ],
      ),
    );
  }


  void _signUpUser() async {
    try {

      setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(
          user: UserEntity(
            uid: '',
            name: '',
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            bio: _bioController.text,
            totalPosts: 0,
            totalFollowing: 0,
            totalFollowers: 0,
            following: [],
            followers: [],
            profileUrl: '',
            website: '',
            imageFile: _image,
          ),
        )
        .then((value) => _clear());

    } catch (e) {
      setState(() {
        _isSigningUp = false;
      });
      toast("Sign up failed. Please try again.");
    }
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _bioController.clear();
      _emailController.clear();
      _passwordController.clear();
      _isSigningUp = false;
    });
  }
}
