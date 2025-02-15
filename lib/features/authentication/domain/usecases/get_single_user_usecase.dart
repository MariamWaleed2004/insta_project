import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class GetSingleUserUsecase {
  final AuthRepository repository;

  GetSingleUserUsecase({required this.repository});

  Stream<List<UserEntity>> call(String uid) {
    return repository.getSingleUser(uid);
  }
}