import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class IsSignInUsecase {
  final AuthRepository repository;

  IsSignInUsecase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}