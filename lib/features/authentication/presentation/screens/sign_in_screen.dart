import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/credential_cubit/credential_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/button_container_widget.dart';
import 'package:clean_arch_pro/features/authentication/presentation/widgets/form_container_widget.dart';
import 'package:clean_arch_pro/features/main_screen/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentailState) {
            if(credentailState is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if(credentailState is CredentialFailure) {
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
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/ic_instagram.svg',
                colorFilter: primaryColorFilter,
              ),
            ),
            sizeVer(30),
            FormContainerWidget(
              controller: _emailController,
              hintText: 'Email',
            ),
            sizeVer(15),
            FormContainerWidget(
              controller: _passwordController,
              hintText: 'Password',
              isPasswordField: true,
            ),
            sizeVer(15),
            ButtonContainerWidget(
              color: blueColor,
              text: 'Sign In',
              onTapListener: () {
                _signInUser();
              },
            ),
              sizeVer(10),
          _isSigningIn == true
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
            Flexible(
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
                  "Don't have an account ?",
                  style: TextStyle(color: primaryColor),
                ),
                sizeHor(8),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, ScreenConst.signUpScreen, (route) => false);
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => SignUpScreen()),(route) => false,);
                  },
                  child: Text(
                    'Sign Up',
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


  void _signInUser() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialCubit>(context).signInUser(
        email: _emailController.text, 
        password: _passwordController.text
        ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
  }
}
