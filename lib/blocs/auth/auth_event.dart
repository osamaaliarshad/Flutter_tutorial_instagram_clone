part of 'auth_bloc.dart';

// holds all auth related events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  final auth.User user;

  AuthUserChanged({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthLogoutRequested extends AuthEvent {}
