import 'package:deporte_app/constants/constants.dart';
import 'package:deporte_app/screens/loginPage.dart';
import 'package:deporte_app/widgets/textFieldNormal.dart';
import 'package:deporte_app/widgets/textFieldPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Createpage extends StatelessWidget {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passController = TextEditingController();

//Función crear cuenta de firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  Future createAccount(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _correoController.text, password: _passController.text);

      logger.d(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          behavior: SnackBarBehavior.floating,
          content: Text("¡Cuenta creada exitosamente!"),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            mapErrorAuth(
              error.toString(),
            ),
          ),
        ),
      );
    }
  }

  String mapErrorAuth(String errorMessage) {
    if (errorMessage.contains("email-already-in-use")) {
      return "La dirección de correo ya esta en uso";
    } else if (errorMessage.contains("invalid-email")) {
      return "El correo no es válido";
    } else if (errorMessage.contains("weak-password")) {
      return "La contraseña no cumple con los estádares";
    } else {
      return "Ocurrió un problema al registrar la cuenta";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
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
              "¡Crea tu cuenta!",
              style: subtitulosStyleWhite,
            ),
            Textfieldnormal(
              txtlabel: "Ingrese correo",
              hint: "Ingrese un correo:",
              controller: _correoController,
            ),
            SizedBox(
              height: 10,
            ),
            Textfieldpass(
              txtlabel: "Ingrese nueva contraseña",
              hint: "Ingrese Nueva Contraseña",
              controller: _passController,
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Loginpage(),
                  ),
                );
              },
              child: Text(
                "o Inicia sesión",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  backgroundColor: const Color.fromARGB(255, 30, 114, 33),
                  foregroundColor: Colors.white),
              onPressed: () {
                createAccount(context);
              },
              child: Text('Crear'),
            ),
          ],
        ),
      )),
    );
  }
}
