import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    //begin interactive sign processs
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth detaails
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new creaddential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //finalluy lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
