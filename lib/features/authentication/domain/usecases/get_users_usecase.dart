import 'package:clean_arch_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_arch_pro/features/authentication/domain/repository/auth_repository.dart';

class GetUsersUsecase {
  final AuthRepository repository;

  GetUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity user) {
    return repository.getUsers(user);
  }
}