import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Stream<User?> authChange() {
    return auth.authStateChanges();
  }

  static Future<void> signUp({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signIn({required String email, required String password}) async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signInWithGoogle() async{
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken
    );
    await auth.signInWithCredential(credential);
  }

  static Future<void> logOut() async{
    await auth.signOut();
    await GoogleSignIn.instance.signOut();
  }
}
