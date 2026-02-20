import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_events.dart';
import 'package:agri_sense_mobile_app/bloc/signup_bloc/signup_states.dart';
import 'package:agri_sense_mobile_app/repositories/signup_repository.dart';
import 'package:agri_sense_mobile_app/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvents, SignupStates>{
  SignupRepository signupRepository = SignupRepository();
   SignupBloc(): super(SignupStates()){
    on<UserNameChanged> (_onUserNameChanged);
    on<EmailChanged> (_onEmailChanged);
    on<PhoneNumberChanged> (_onPhoneNumberChanged);
    on<PasswordChanged> (_onPasswordChanged);
    on<CreateAccountButton> (_onCreateAccountButton);
   }


   // UserName Event Changes
   void _onUserNameChanged(UserNameChanged event, Emitter<SignupStates> emit){
    emit(state.copyWith(
      userName : event.userName
    ));
   }

   // Email Event Changes
   void _onEmailChanged (EmailChanged event, Emitter<SignupStates> emit){
    emit(state.copyWith(
      email: event.email
    ));
   }

   // Phone Number Event Changes
   void _onPhoneNumberChanged (PhoneNumberChanged event, Emitter<SignupStates> emit){
    emit(state.copyWith(
      phoneNumber:  event.phoneNumber
    ));
   }

   //Password Changes Event
   void _onPasswordChanged (PasswordChanged event, Emitter<SignupStates> emit){
    emit(state.copyWith(
      password: event.password
    ));
   }

   Future<void> _onCreateAccountButton(
    CreateAccountButton event ,
     Emitter<SignupStates> emit)async{
    emit(state.copyWith(
      authStates: AuthStates.loading,
    ));
    
    try{
      // await  Future.delayed(Duration(milliseconds: 100));
      await signupRepository.Signup(
        userName: state.userName, 
        email: state.email, 
        phoneNumber: state.phoneNumber,
         password: state.password);

         emit(state.copyWith(
          authStates: AuthStates.success,
          message: "Account Created Successfully"
         ));

             debugPrint("Account created successfully for: ${state.email} \n ${state.userName} \n ${state.phoneNumber}");
    }
    catch(e){
      emit(state.copyWith(
        authStates: AuthStates.error,
        message: e.toString().replaceAll('Exception: ', ''),
      ));
      debugPrint("Account Creation Failed... ${e}");
    }

   } 
}