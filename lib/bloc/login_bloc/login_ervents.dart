import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable{
  const LoginEvents();

  @override
  List<Object> get props => [];
}


//Email Event
class EmailChanged extends LoginEvents{
  final String email;
  const EmailChanged({
    required this.email,
  });

  @override
  List<Object> get props =>[email];
}



// Password Event
class PasswordChanged extends LoginEvents{
  final String password;
  const PasswordChanged({
    required this.password
  });

  @override
  List<Object> get props => [password];
}

//Login Button Event
class LoginButtonClicked extends LoginEvents{}