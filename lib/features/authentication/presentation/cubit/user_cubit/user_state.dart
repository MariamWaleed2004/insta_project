part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

}

class UserInitial extends UserState {

  @override
  List<Object> get props => [];
}


class UserLoaded extends UserState {
  final List<UserEntity> users;

  UserLoaded({required this.users});

  @override
  List<Object> get props => [
    users
    ];
}


class UserUpdating extends UserState {
   @override
  List<Object> get props => [];
}

class UserUpdated extends UserState {
    @override
  List<Object> get props => [];
}


class UserFailure extends UserState {
    @override
  List<Object> get props => [];
}
