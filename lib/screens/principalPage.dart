import 'package:deporte_app/screens/createPage.dart';
import 'package:deporte_app/screens/loginPage.dart';
import 'package:flutter/material.dart';

class Princialpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/6495098/pexels-photo-6495098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 200,
                            child: Image.asset(
                              "assets/images/LogoGrass.png",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TransparentButton(
                        text: 'Iniciar sesión',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      TransparentButton(
                        text: 'Crear Cuenta',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createpage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransparentButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  TransparentButton({required this.text, required this.onPressed});

  @override
  _TransparentButtonState createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  Color _buttonColor = Colors.transparent; // Color inicial

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _buttonColor = Colors.grey.withOpacity(0.5); // Color al presionar
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _buttonColor = Colors.transparent; // Vuelve al color inicial
    });
    widget.onPressed(); // Ejecuta la acción al soltar
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Container(
        decoration: BoxDecoration(
          color: _buttonColor,
          border: Border.all(color: Colors.black, width: 2), // Borde negro
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 80.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
