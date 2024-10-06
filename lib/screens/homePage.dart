import 'package:deporte_app/screens/listaPages.dart';
import 'package:deporte_app/screens/negociosPages.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentPage = 0;

  final List<Widget> _pages = [
    Negociospages(),
    Listapages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
        ],
        currentIndex: _currentPage,
        fixedColor: const Color.fromARGB(255, 11, 111, 0),
        onTap: (int inIndex) {
          setState(() {
            _currentPage = inIndex;
          });
        },
      ),
    );
  }
}
