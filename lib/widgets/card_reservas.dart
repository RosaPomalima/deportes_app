import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/reservas_models.dart';
import 'package:flutter/material.dart';

class CardReservas extends StatelessWidget {
  final ReservasModels reserva;

  CardReservas({required this.reserva});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Text(
            reserva.grass,
            style: tituloBienvenida,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Datos:  "),
                    Text(
                      reserva.datos,
                      style: subtitulosStyleWhite,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Fecha: "),
                    Text(
                      reserva.fecha,
                      style: subtitulosStyleWhite,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Hora: "),
                    Text(
                      reserva.horario,
                      style: subtitulosStyleWhite,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
