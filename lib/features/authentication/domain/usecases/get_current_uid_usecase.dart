import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class GetCurrentUidUsecase {
  final AuthRepository repository;

  GetCurrentUidUsecase({required this.repository});

  Future<String> call() {
    return repository.getCurrentUid();
  }
}