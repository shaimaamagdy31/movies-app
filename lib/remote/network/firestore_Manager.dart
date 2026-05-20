import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../model/user.dart';

class FirestoreManager {
  static CollectionReference<User> getUserCollection(){
    var collection = FirebaseFirestore.instance
        .collection("User")
        .withConverter(
        fromFirestore: (snapshot,options){
          User user=User.fromFirestore(snapshot.data());
          return user;
        },
        toFirestore: (value,options){
          return value.toFirestore();
        }
    );
    return collection;
  }



  static Future<void> saveUser(User user) async {

    var collection=getUserCollection();

    var document = collection.doc(user.id);

    await document.set(user);
  }

  static Future<User?> getUser() async {

    var collection=getUserCollection();

    var document = collection.doc(auth.FirebaseAuth.instance.currentUser!.uid);

    var snapshot= await document.get();

    var user= snapshot.data();

    return user;

  }





}