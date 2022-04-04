import 'package:flutter/material.dart';

class ProdutoClicado extends StatefulWidget {
  const ProdutoClicado(
      {required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.valor});
  final String titulo;
  final String descricao;
  final String imagem;
  final String valor;

  @override
  State<StatefulWidget> createState() {
    return ProdutoClicadoPage();
  }
}

class ProdutoClicadoPage extends State<ProdutoClicado> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
