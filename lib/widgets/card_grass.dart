import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/models/grass_models.dart';
import 'package:flutter/material.dart';

class CardGrass extends StatelessWidget {
  final GrassModels grass;

  CardGrass({required this.grass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/16879249/pexels-photo-16879249/free-photo-of-campo-hombres-jugando-deporte.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Text(
            grass.nombre,
            style: tituloBienvenidaHome,
          ),
          Text(
            "Atención:",
            style: txtdefinido,
          ),
          Text(
            grass.atencion,
            style: atenciontxt,
          )
        ],
      ),
    );
  }
}
