import 'dart:io';

import 'package:clean_arch_pro/features/authentication/data/datasources/remote_data_sources/auth_remote_data_source.dart';
import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';



class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<bool> isSignIn() async 
  => authRemoteDataSource.isSignIn();

  @override
  Future<void> signInUser(UserEntity user) async
  => authRemoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async
  => authRemoteDataSource.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async
  => authRemoteDataSource.signUpUser(user);

  @override
  Future<void> createUser(UserEntity user) async 
  => authRemoteDataSource.createUser(user);

  @override
  Future<String> getCurrentUid() async
  => authRemoteDataSource.getCurrentUid();

    @override
  Future<String> uploadImageToStorage(File? file, bool isPost, String childName) async 
  => authRemoteDataSource.uploadImageToStorage(file, isPost, childName);
  
  @override
  Stream<List<UserEntity>> getSingleUser(String uid) 
  => authRemoteDataSource.getSingleUser(uid);
  
  
  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) 
  => authRemoteDataSource.getUsers(user);
  
  @override
  Future<void> updateUser(UserEntity user) async 
  => authRemoteDataSource.updateUser(user);

    
}