import 'dart:io';

import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';


class UploadImageToStorageUsecase {
  final AuthRepository repository;

  UploadImageToStorageUsecase({required this.repository});

  Future<String> call(File file, bool isPost, String childName) {
    return repository.uploadImageToStorage(file, isPost, childName);
  }
}