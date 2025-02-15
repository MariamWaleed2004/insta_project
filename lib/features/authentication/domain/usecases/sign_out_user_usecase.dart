
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class SignOutUserUsecase {
  final AuthRepository repository;

  SignOutUserUsecase({required this.repository});

  Future<void> call() {
    return repository.signOut();
  }
}