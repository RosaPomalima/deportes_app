import 'package:deporte_app/models/servicios_models.dart';
import 'package:flutter/material.dart';

class CardServicios extends StatelessWidget {
  final ServiciosModels servicios;

  CardServicios({required this.servicios});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 80,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                servicios.imageSer,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              servicios.nombreSer,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
