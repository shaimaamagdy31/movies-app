import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {

  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn=GoogleSignIn.instance;
  String webClientId="187429563916-ud8dsbelfgl245sj447k1h1g49q7soqr.apps.googleusercontent.com";

   Future<UserCredential?>  signInWithGoogle() async {

    //  sign in Google with my project
    await googleSignIn.initialize(
      clientId: webClientId
    );

    // return Google accounts and choose account
    final GoogleSignInAccount? googleSignInAccount= await googleSignIn.authenticate();

    if(googleSignInAccount ==null)return null;


    // get id token
    final GoogleSignInAuthentication googleAuth =googleSignInAccount.authentication;


    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.idToken
    );
    // pass credential to firebaseAuth

    return await firebaseAuth.signInWithCredential(credential);
  }




}