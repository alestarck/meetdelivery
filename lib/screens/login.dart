import 'package:flutter/material.dart';
import 'package:meetdelivery_modelo/screens/home.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginWidgetPage();
  }
}

class LoginWidgetPage extends State<LoginWidget> {
  late String email, senha = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // IMAGEM DO LOGOTIPO
          Image.asset("imagens/logodelivery.png"),
          // ...
          // CONTAINER PARA O EMAIL
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: 30,
            margin: const EdgeInsets.only(top: 10.0),
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.red),
                    // focado
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    // não focado
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          // ...
          // CONTAINER PARA A SENHA
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: 30,
            margin: const EdgeInsets.only(top: 15.0),
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: TextField(
              onChanged: (value) {
                senha = value;
              },
              decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.red),
                  // focado
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  // não focado
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          // ...
          // COMANDO ESQUECER A SENHA
          GestureDetector(
            child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 15.0, right: 20.0),
              child: const Text("Esqueci a senha",
                  style: TextStyle(color: Colors.blue, fontSize: 16)),
            ),
            onTap: () {},
          ),
          // ...
          // BOTÃO CONFIRMAR
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: 35,
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: const Text(
                "Confirmar",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              if (email == "alexandremarques1415@gmail.com" &&
                  senha == "123456") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreenWidget()));
              }
            },
          ),
          // ...
          // BOTÃO FACEBOOK
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 35,
              margin: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(child: Image.asset("imagens/facebook.png")),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Conecte com facebook",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
          // ...
          // BOTAO GOOGLE
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 35,
              margin: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset("imagens/google.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Conecte com google",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              print("gesture dedectado");
            },
          ),
          // ...
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  // CRIAR UMA CONTA NOVA
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 20, left: 20),
                      child: const Text(
                        "Criar uma conta",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      print("FUNCIONOU");
                    },
                  ),
                  // ...
                  // ENTRAR COMO CONVIDADO
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.topRight,
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 20, right: 20),
                      child: const Text(
                        "Entrar como convidado",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ))
        ],
      ),
    );
  }
}
