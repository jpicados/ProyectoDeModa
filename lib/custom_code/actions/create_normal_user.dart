// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<DocumentReference> createNormalUser(
  String emailAddress,
  String userName,
  String pPassword,
  String randomDoc,
) async {
  DateTime createdTime = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp(
      name: randomDoc, options: Firebase.app().options);

  UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
      .createUserWithEmailAndPassword(email: emailAddress, password: pPassword);

  String? uid = userCredential.user?.uid;

  final CollectionReference<Map<String, dynamic>> userRef =
      FirebaseFirestore.instance.collection('users');
  userRef.doc(uid).set({
    'email': emailAddress,
    'uid': uid,
    'display_name': userName,
    'created_time': createdTime
  });

  final firestore = FirebaseFirestore.instance;
  final collectionUsersRef = firestore.collection('users');
  final encontrado =
      await collectionUsersRef.where('uid', isEqualTo: uid).get();

  UsersRecord usuario = await UsersRecord.fromSnapshot(encontrado.docs[0]);

  DocumentReference userRerence =
      FirebaseFirestore.instance.doc('/users/' + usuario.uid);

  return userRerence;
}
