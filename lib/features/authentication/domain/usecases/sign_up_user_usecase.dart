import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class SignUpUserUsecase {
  final AuthRepository repository;

  SignUpUserUsecase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signUpUser(user);
  }
}