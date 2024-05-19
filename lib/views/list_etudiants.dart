import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ri9abe/controllers/etudiantcontroller.dart';
import 'package:ri9abe/models/etudiant.dart';

class EtudiantView extends StatelessWidget {
  const EtudiantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<EtudiantController>(
            builder: (value) => Text("Etudiants:${value.nb}")),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(children: <Widget>[
      GetBuilder<EtudiantController>(
          builder: (value) => Expanded(
                  child: FutureBuilder<List<Etudiant>>(
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (ctx, index) {
                          Etudiant etudiant = snapshot.data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Card(
                                  elevation: 2,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            etudiant.nomEtudiant,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            etudiant.prenomEtudiant,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          dense: true,
                                          leading: const Icon(Icons.home),
                                        ),
                                      ])),
                            ),
                          );
                        },
                        itemCount: value.nb //pdvs?.length ?? 0,
                        );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                future: value.populateDb(),
              )))
    ]);
  }
}
