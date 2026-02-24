import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {

  final String email;
  final String password;
  final String message;
  final AuthStates authStates;

 const LoginStates({
    this.email = "",
    this.password = "",
    this.message = "",
    this.authStates = AuthStates.initial
  });

  LoginStates copyWith({
    String? email,
    String? password,
    String? message,
    AuthStates? authStates,
  }){
    return LoginStates(
      email: email?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      authStates: authStates?? this.authStates,
    );
  }

  @override
  List<Object> get props =>[email, password, message, authStates];
}