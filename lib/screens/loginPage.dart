import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/screens/homePage.dart';
import 'package:deporte_app/widgets/textFieldNormal.dart';
import 'package:deporte_app/widgets/textFieldPass.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Loginpage extends StatelessWidget {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  Future<void> login(BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: _correoController.text,
        password: _passController.text,
      )
          .then((value) {
        logger.d(value);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 290,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 114, 33),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.elliptical(450, 250)),
              ),
              child: Image.asset("assets/images/LogoGrass.png"),
            ),
            Text(
              "Bienvenido",
              style: tituloBienvenida,
            ),
            Text(
              "Ingrese a su cuenta",
              style: subtitulosStyleWhite,
            ),
            Textfieldnormal(
              controller: _correoController,
              txtlabel: "Ingrese correo",
              hint: "Ingrese su correo:",
            ),
            SizedBox(
              height: 10,
            ),
            Textfieldpass(
              controller: _passController,
              txtlabel: "Ingrese contraseña",
              hint: "Ingrese Contraseña",
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
                login(context);
              },
              child: Text('Iniciar'),
            ),
          ],
        ),
      )),
    );
  }
}
