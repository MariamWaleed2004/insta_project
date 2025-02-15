import 'package:clean_arch_pro/features/authentication/data/datasources/remote_data_sources/auth_remote_data_source.dart';
import 'package:clean_arch_pro/features/authentication/data/datasources/remote_data_sources/auth_remote_data_source_impl.dart';
import 'package:clean_arch_pro/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/upload_image_to_storage_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/create_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/get_current_uid_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/get_single_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/sign_in_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/sign_up_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/update_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/is_sign_in_usecase.dart';
import 'package:clean_arch_pro/features/authentication/domain/usecases/sign_out_user_usecase.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/credential_cubit/credential_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/get_single_user_cubit/get_single_user_cubit.dart';
import 'package:clean_arch_pro/features/authentication/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;


Future<void> init() async {
  // Cubits
  sl.registerFactory(
    () => AuthCubit(
    signOutUserUsecase: sl.call(),
    isSignInUsecase: sl.call(),
    getCurrentUidUsecase: sl.call(),
     ));

     sl.registerFactory(
    () => CredentialCubit(
      signInUserUsecase: sl.call(),
      signUpUserUsecase: sl.call(),
     ));

     sl.registerFactory(
    () => UserCubit(
      getUsersUsecase: sl.call(),
      updateUserUsecase: sl.call(),
     ));

      sl.registerFactory(
    () => GetSingleUserCubit(
      getSingleUserUsecase: sl.call(),
     ));


 
  // Use Cases
  sl.registerLazySingleton(() => SignOutUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUsecase(repository: sl.call()));


  // Cloud Storage
  sl.registerLazySingleton(() => UploadImageToStorageUsecase(repository: sl.call()));
  



  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl.call()));

  //Remote Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseAuth: sl.call(), firebaseStorage: sl.call()));


  // Externals
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}