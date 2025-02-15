import 'package:clean_arch_pro/core/on_generate_route.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/credential_cubit/credential_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/get_single_user_cubit/get_single_user_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:clean_arch_pro/features/main_screen/presentation/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_pro/core/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        darkTheme: ThemeData.dark(),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {

                if(authState is Authenticated) {
                return MainScreen(uid: authState.uid);
                } else {
                  return SignInScreen();
                }
              },
            );
          }
        },
      ),
    );
  }
}
