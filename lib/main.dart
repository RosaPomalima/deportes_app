import 'package:deporte_app/firebase_options.dart';
import 'package:deporte_app/screens/principalPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Princialpage(),
    ),
  );
}
