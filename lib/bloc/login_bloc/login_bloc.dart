import 'package:agri_sense_mobile_app/bloc/login_bloc/login_ervents.dart';
import 'package:agri_sense_mobile_app/bloc/login_bloc/login_states.dart';
import 'package:agri_sense_mobile_app/repositories/login_repository.dart';
import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc  extends Bloc<LoginEvents, LoginStates>{
  LoginRepository loginRepository = LoginRepository();
   LoginBloc(): super(LoginStates()){
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginButtonClicked>(_onLoginButtonClicked);
   }

// Email Changed
   void _onEmailChanged (EmailChanged event, Emitter<LoginStates> emit){
    emit(state.copyWith(
      email: event.email
    ));
   }
   
   //Password Changed
   void _onPasswordChanged (PasswordChanged event, Emitter<LoginStates>emit){
    emit(state.copyWith(
      password: event.password
    ));
   }

   //Login Button CLicked
   Future<void> _onLoginButtonClicked(LoginButtonClicked event, Emitter<LoginStates>emit)async{
    emit(state.copyWith(
      authStates: AuthStates.loading
    ));

    try{
      await loginRepository.Login(
        email: state.email, password: state.password);
        emit(state.copyWith(
          authStates: AuthStates.success,
          message: "Login Successfull",
        ));
        debugPrint("Account Loggedin Successfully for:\n ${state.email}\n ${state.password}");
    }
    catch(e){
      emit(state.copyWith(
        authStates: AuthStates.error,
        message: e.toString().replaceAll('Exception: ', ''),
      ));
      debugPrint("Failed to login your account:\n ${e}");
    }
   }
} 