import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>((event, emit) {
      emit(SignUpLoading());
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(SignUpSuccess());
      } on Exception catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}
