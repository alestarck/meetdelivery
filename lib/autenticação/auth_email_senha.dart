import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<FirebaseApp> inicialicacao = Firebase.initializeApp();
  signEmailSenha(String email, String senha) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((UserCredential) =>
            // mensagem que deu certo
            print("CONECTADO"));
  }
}
