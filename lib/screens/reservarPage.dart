import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/grass_models.dart';
import 'package:deporte_app/widgets/textFieldNormal.dart';
import 'package:flutter/material.dart';

class Reservarpage extends StatelessWidget {
  final GrassModels grass;
  Reservarpage({Key? key, required this.grass}) : super(key: key);

  TextEditingController _datospersonales = TextEditingController();
  TextEditingController _celular = TextEditingController();
  TextEditingController _fecha = TextEditingController();
  TextEditingController _horario = TextEditingController();
  TextEditingController _comentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reserva tu Grass",
          style: tituloBienvenidaHome,
        ),
        backgroundColor: const Color.fromARGB(255, 28, 117, 31),
      ),
      body: SafeArea(
          child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                grass.nombre,
                style: tituloBienvenida,
              ),
              SizedBox(
                height: 20,
              ),
              Textfieldnormal(
                controller: _datospersonales,
                txtlabel: "Ingrese nombre y apellido",
                hint: "Ingrese nombre y apellido",
              ),
              Textfieldnormal(
                controller: _celular,
                txtlabel: "Ingrese celular",
                hint: "Ingrese su celular:",
              ),
              Textfieldnormal(
                controller: _fecha,
                txtlabel: "Ingrese la fecha",
                hint: "Ingrese la fecha:",
              ),
              Textfieldnormal(
                controller: _horario,
                txtlabel: "Ingrese el horario",
                hint: "Ingrese el horario",
              ),
              Textfieldnormal(
                controller: _comentario,
                txtlabel: "Ingrese comentario",
                hint: "Ingrese comentario adicional:",
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    backgroundColor: const Color.fromARGB(255, 30, 114, 33),
                    foregroundColor: Colors.white),
                onPressed: () {
                  CollectionReference collectionReference =
                      FirebaseFirestore.instance.collection('reserva');
                  collectionReference.add({
                    'grass': grass.nombre.toString(),
                    'datos': _datospersonales.text,
                    'celular': _celular.text,
                    'fecha': _fecha.text,
                    'horario': _horario.text,
                    'comentario': _comentario.text,
                  });
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
