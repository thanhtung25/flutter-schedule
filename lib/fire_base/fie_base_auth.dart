// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth{
  
  // ignore: prefer_final_fields

  Future<void> signUp(String email, String pass, String name, String phone,Function onSuccess, Function(String) onSignUpError) async {
    // _firebaseAuth
    //   .createUserWithEmailAndPassword(email: email, password: pass)
    //   .then((user) {

    //   _createUser( name , phone,onSuccess, onSignUpError);
    // }).catchError((err){
    //   if(err.code == 'email-already-in-use') {
    //     onSignUpError("email already in use");
    //   }
    //   // _onSignUpErr(err.code, onSignUpError);
    // });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, 
        password: pass);
      await  _createUser( name , phone,onSuccess, onSignUpError);
    // ignore: empty_catches
    } on FirebaseAuthException catch (error) {
      _onSignUpErr(error.code,onSignUpError);
    } catch (e) {
      print("An unexpected error occurred: $e");
    }
    
  }
  Future<void> signIn(String email,String pass, Function onSuccess,Function(String) onSignInError) async {
    try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, 
        password: pass);
        onSuccess();
    }on FirebaseAuthException{
      onSignInError('Sign-In fail, please try again');
    } catch (e) {
      print("An unexpected error occurred: $e");
    }
  }

  _createUser( String name, String phone,Function onSuccess, Function(String) onSignUpError){
      var user = {
        "name" : name,
        "phone" : phone
      };
      var ref = FirebaseDatabase.instance.ref().child("users");
      ref.set(user).then((user) => {
        // thanh cong
      onSuccess()
      // ignore: body_might_complete_normally_catch_error
      }).catchError((err){
        onSignUpError('Signup fail, please try again');
      });
    }
}


  /// - **email-already-in-use**:
  ///  - Thrown if there already exists an account with the given email address.
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **operation-not-allowed**:
  ///  - Thrown if email/password accounts are not enabled. Enable
  ///    email/password accounts in the Firebase Console, under the Auth tab.
  /// - **weak-password**:
  ///  - Thrown if the password is not strong enough.
  void _onSignUpErr(String code, Function(String) onSignUpError){
    switch(code){
      case 'email-already-in-use':
        onSignUpError("email already in use");
        break;
      case 'invalid-email':
        onSignUpError("invalid email");
        break;
      case 'operation-not-allowed':
        onSignUpError("email/password accounts are not enable");
        break;
      case 'weak-password':
        onSignUpError("the password is not strong enough");
        break;
    }
  }

  // ignore: non_constant_identifier_names
  