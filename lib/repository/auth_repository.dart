import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref)=> AuthRepository(
    googleSignIn: GoogleSignIn(),
  )
);

class AuthRepository {

  final GoogleSignIn _googleSignIn;
  AuthRepository({required GoogleSignIn googleSignIn}): _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if(googleUser != null){
        print( googleUser.email);
        print( googleUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }
}

