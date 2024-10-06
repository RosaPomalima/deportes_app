import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/grass_models.dart';
import 'package:deporte_app/models/servicios_models.dart';
import 'package:deporte_app/screens/reservarPage.dart';
import 'package:deporte_app/widgets/card_servicios.dart';
import 'package:flutter/material.dart';

class Nosotrospage extends StatelessWidget {
  final GrassModels grass;
  const Nosotrospage({Key? key, required this.grass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 117, 31),
        title: Text(
          "GRASS DEPORTIVO",
          style: tituloBienvenidaHome,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.orange,
              width: double.infinity,
              height: 300.0,
              child: Image.network(
                grass.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          grass.nombre,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(grass.atencion),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(grass.ubicacion),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Servicios",
              style: subtitulosStyleWhite,
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("servicios")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return CardServicios(
                          servicios: ServiciosModels(
                            imageSer: documentSnapshot["image"],
                            nombreSer: documentSnapshot["nombre"],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 50),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                backgroundColor: const Color.fromARGB(255, 30, 114, 33),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Reservarpage(
                            grass: grass,
                          )),
                );
              },
              child: Text('Reservar'),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
