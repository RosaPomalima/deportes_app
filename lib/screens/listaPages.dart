import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/reservas_models.dart';
import 'package:deporte_app/widgets/card_reservas.dart';
import 'package:flutter/material.dart';

class Listapages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 117, 31),
        title: Text(
          "LISTA DE RESERVAS",
          style: tituloBienvenidaHome,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("reserva")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        ReservasModels reservas = ReservasModels(
                          grass: documentSnapshot["grass"],
                          datos: documentSnapshot["datos"],
                          horario: documentSnapshot["horario"],
                          fecha: documentSnapshot["fecha"],
                        );
                        return GestureDetector(
                          child: CardReservas(reserva: reservas),
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
