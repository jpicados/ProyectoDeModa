import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBjkZwQFKiRfirPiOXvxYDc9zOODb1WlsE",
            authDomain: "semana4jn-c5943.firebaseapp.com",
            projectId: "semana4jn-c5943",
            storageBucket: "semana4jn-c5943.appspot.com",
            messagingSenderId: "976007233469",
            appId: "1:976007233469:web:db8d96adca8d07e7a11cd4",
            measurementId: "G-556EW5ZLQE"));
  } else {
    await Firebase.initializeApp();
  }
}
