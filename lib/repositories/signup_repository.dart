import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepository {
  final _auth = FirebaseAuth.instance;

  Future<User?> Signup({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(userName);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      CustomSnackbar(e.message ?? e.toString()); 
      
      throw Exception(e.message); 
    }
  }
}