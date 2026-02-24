import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final _auth = FirebaseAuth.instance;

  Future<User?> Login({
    required String email,
    required String password,
  })async{
    try{
      final result = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password);
        return result.user;
    } on FirebaseAuthException catch(e){
      CustomSnackbar(e.message ?? e.toString());

      throw Exception(e.toString());
    }
  }
}