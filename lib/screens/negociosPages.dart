import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/grass_models.dart';
import 'package:deporte_app/screens/nosotrosPage.dart';
import 'package:deporte_app/widgets/card_grass.dart';
import 'package:flutter/material.dart';

class Negociospages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 117, 31),
        title: Text(
          "Bienvenido!",
          style: tituloBienvenidaHome,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "¿Dónde vamos a jugar hoy?",
              style: tituloBienvenida,
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("grass").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        GrassModels grass = GrassModels(
                          nombre: documentSnapshot["nombre"],
                          atencion: documentSnapshot["atencion"],
                          image: documentSnapshot["image"],
                          ubicacion: documentSnapshot["ubicacion"],
                        );
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Nosotrospage(grass: grass),
                              ),
                            );
                          },
                          child: CardGrass(grass: grass),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
