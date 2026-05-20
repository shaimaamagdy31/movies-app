import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/user.dart' as MyUser;
import '../../../remote/network/firestore_Manager.dart';

class SignupAuthCubit extends Cubit<AuthStates>{
  SignupAuthCubit() : super(AuthInitialState());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp({required String name, required String email, required String password, required String phone,required String idAvatar}) async {

    try{
      emit(AuthLoadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirestoreManager.saveUser(
       MyUser.User(
        name:name,
        email: email,
        phone:phone,
        idAvatar: idAvatar,
        id: FirebaseAuth.instance.currentUser!.uid,
        favorites: [],
      )
      );
      emit(AuthSuccessState());

    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('The password provided is too weak.'));

      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState("The account already exists for that email."));
      }
    }catch(e){
      emit(AuthErrorState(e.toString()));
    }
  }


}
sealed class AuthStates{}

class AuthInitialState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthErrorState extends AuthStates{
  String errorMsg;
  AuthErrorState(this.errorMsg);
}
class AuthSuccessState extends AuthStates{}