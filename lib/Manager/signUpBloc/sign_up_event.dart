part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  SignUpSubmitted({required this.email, required this.password});
}
