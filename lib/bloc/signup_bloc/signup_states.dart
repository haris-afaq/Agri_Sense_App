import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:equatable/equatable.dart';

class SignupStates extends Equatable{
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String message;
  final AuthStates authStates;

  // Here we will defin initial states of the events
  const SignupStates({
    this.userName = "",
    this.email = "",
        this.phoneNumber = "",
    this.password = "",
    this.message = "",
    this.authStates = AuthStates.initial

  });

  // CopyWith Method bhi banana hai ju keh hamare liye instance create karega
  SignupStates copyWith({
    String? userName,
    String?email,
    String? phoneNumber,
    String? password,
    String? message,
    AuthStates? authStates,
  }){
    return SignupStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber?? this.phoneNumber,
      password: password ?? this.password,
      message: message?? this.message,
      authStates: authStates?? this.authStates,
    );
  }

  @override
  List<Object> get props => [userName, email,  phoneNumber, password, message, authStates];
} 