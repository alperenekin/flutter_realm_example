part of 'user_cubit.dart';

@immutable
sealed class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoaded extends UserState {
  final List<LocalUser> users;

  const UserLoaded(this.users);
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserAdded extends UserState {
  const UserAdded();
}

class UserDeleted extends UserState {
  const UserDeleted();
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
}
