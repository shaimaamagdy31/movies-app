import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/remote/network/firestore_Manager.dart';
import '../../../model/user.dart' as MyUser;
import '../../../remote/network/signin_with_google.dart';

class SignInAuthCubit extends Cubit<AuthSignInStates>{
  SignInAuthCubit() : super(AuthSignInInitialState());
  /*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   */
  Future<void> signIn({ required String email, required String password}) async {

    try{
      emit(AuthSignInLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(AuthSignInSuccessState());

    }on FirebaseAuthException catch (e) {
      if ( e.code == 'invalid-credential') {

        emit(AuthSignInErrorState('Invalid Email Or Password'));

      }else{

        emit(AuthSignInErrorState(e.toString()));

      }

    }catch(e){
      emit(AuthSignInErrorState(e.toString()));

    }
  }

  Future<void> signInWithGoogle() async {
    try{
      emit(AuthSignInLoadingState());
      SignInWithGoogle obj=SignInWithGoogle();
      final userCredential = await obj.signInWithGoogle();
      if(userCredential== null)return;
      final user = userCredential.user;
      bool isFound=await FirestoreManager.checkUserFound(user!.uid);
      if(isFound){
        emit(AuthSignInSuccessState());
      }else{
        await FirestoreManager.saveUser(
          MyUser.User(
            name: user.displayName,
            email: user.email,
            idAvatar: "0",
            favorites: [],
            phone: user.phoneNumber,
            id: user.uid,

          ),
        );
        emit(AuthSignInSuccessState());
      }

    }catch(e){
      if(e.toString().contains("canceled")){
        emit(AuthSignInInitialState());
      }else{
        emit(AuthSignInErrorState(e.toString()));
      }

    }


  }


}
sealed class AuthSignInStates{}

class AuthSignInInitialState extends AuthSignInStates{}
class AuthSignInLoadingState extends AuthSignInStates{}
class AuthSignInErrorState extends AuthSignInStates{
  String errorMsg;
  AuthSignInErrorState(this.errorMsg);
}
class AuthSignInSuccessState extends AuthSignInStates{}