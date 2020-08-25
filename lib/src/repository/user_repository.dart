import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  //Sign In With Google

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser;
  }

  //Sign In With Credentials

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //SignUp - registro

  Future<void> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //SignOut

  Future<void> isgnOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  //Esta Logueado ?

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  // Obtener ususario

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser).email;
  }
}