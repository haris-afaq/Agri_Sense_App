import 'package:equatable/equatable.dart';


abstract class SignupEvents extends Equatable{
  const SignupEvents();
  @override
  List<Object> get props => [];
}

// User Name Event

class UserNameChanged extends SignupEvents{
  final String userName;
  const UserNameChanged ({
    required this.userName,
  });

  @override
  List<Object> get props =>[userName]; 
}

// Email event

class EmailChanged extends SignupEvents{
  final String email;
  const EmailChanged({
    required this.email
  });

  @override
  List<Object> get props => [email];
}

// Phone Number event

class PhoneNumberChanged extends SignupEvents{
  final String phoneNumber;
  const PhoneNumberChanged({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

// Password Event

class PasswordChanged extends SignupEvents{
  final String password;

  const PasswordChanged ({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}

// Create Account Button Event

class CreateAccountButton extends SignupEvents{
  
}
