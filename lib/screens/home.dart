import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenWidgetPage();
  }
}

class HomeScreenWidgetPage extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Produtos").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Aguande..."),
                );
              }

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    floating: false,
                    snap: false,
                    pinned: false,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                        "Baru Drink's & Petiscos",
                        style: TextStyle(color: Colors.white),
                      ),
                      background: Image.network(
                        snapshot.data?.docs[0]["c_imagem_logo"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // ...

                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // PRIMEIRO CONTAINER
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CONTAINER ENTREGA
                              Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                margin: const EdgeInsets.only(
                                  right: 7,
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  child: const Text(
                                    "Entrega*",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // ...
                              // CONTAINER AGENDAMENTO
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                margin: const EdgeInsets.only(left: 7),
                                decoration: const BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  child: const Text(
                                    "<Hoje, 45-55 minutos >",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // ...
                        // SEGUNDO CONTAINER
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  margin: const EdgeInsets.only(right: 7),
                                  decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                    child: const Text(
                                      "Entrega: Grátis>",
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                // ...
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.only(left: 7),
                                    decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 10,
                                          right: 10),
                                      child: const Text(
                                        "Pesquisar",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ))
                              ]),
                        ),
                        // ...
                      ],
                    ),
                  ),
                  // ...

                  // LISTA DOS PRODUTOS
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          ((context, int index) {
                    return GestureDetector(
                      child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // TITULO
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    margin:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: Text(
                                      snapshot.data?.docs[index]["titulo"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  // ...
                                  // DESCRIÇÃO
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      snapshot.data?.docs[index]["descricao"],
                                      maxLines: 4,
                                    ),
                                  ),
                                  // ...
                                ],
                              ),
                              // ...
                              // DEFINIÇÃO DE IMAGEM DE CADA INDEX
                              Align(
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  child: Image.network(
                                    snapshot.data?.docs[index]["imagem"],
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              // ...
                              // VALOR DO PRODUTO
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Text(
                                        snapshot.data?.docs[index]["valor"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                ),
                              )
                              // ...
                            ],
                          )),
                      onTap: () {},
                    );
                  }),
                          childCount: snapshot.data?.docs[0]
                              ["contador"] // CONTADOR DE CONTEÚDO,
                          ))
                ],
              );
            }));
  }
}
