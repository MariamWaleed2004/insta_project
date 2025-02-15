import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:clean_arch_pro/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:clean_arch_pro/features/comment/presentation/screens/comment_screen.dart';
import 'package:clean_arch_pro/features/home/presentation/screens/update_post_screen.dart';
import 'package:clean_arch_pro/features/profile/presentation/screens/edit_profile_screen.dart';

import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case ScreenConst.editProfileScreen: {
        return routeBuilder(EditProfileScreen());
      }
      case ScreenConst.updatePostScreen: {
        return routeBuilder(UpdatePostScreen());
      }
      case ScreenConst.commentScreen: {
        return routeBuilder(CommentScreen());
      }
      case ScreenConst.signInScreen: {
        return routeBuilder(SignInScreen());
      }
      case ScreenConst.signUpScreen: {
        return routeBuilder(SignUpScreen());
      }
    
       
      default: NoScreenFound();
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (ctx) => child);
}


class NoScreenFound extends StatelessWidget {
  const NoScreenFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not found'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}