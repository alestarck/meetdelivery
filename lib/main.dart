// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meetdelivery_modelo/screens/home.dart';
import 'package:meetdelivery_modelo/screens/login.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFDFBF9)),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final Future<FirebaseApp> inicializacao = Firebase.initializeApp();

  // Future<bool> Auth() async {
  //   final String _Auth = await FirebaseAuth.instance.currentUser!.uid;
  //   if (_Auth != null) {
  //     return true;
  //   } else {

  //     return false;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFDFBF9),
        body: FutureBuilder(
          future: inicializacao,
          builder: (context, app) {
            if (app.connectionState == ConnectionState.done) {
              return HomeScreenWidget();
            }
            return const Center(
              child: Text("Carregando..."),
            );
          },
        ));
  }
}
