import 'package:flutter/material.dart';

class Textfieldpass extends StatefulWidget {
  String hint, txtlabel;
  TextEditingController controller;
  Textfieldpass(
      {required this.controller, required this.hint, required this.txtlabel});

  @override
  State<Textfieldpass> createState() => _TextFieldPassWidgetState();
}

class _TextFieldPassWidgetState extends State<Textfieldpass> {
  bool isInvisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: widget.controller,
              obscureText: isInvisible,
              decoration: InputDecoration(
                  label: Text(widget.txtlabel),
                  hintText: widget.hint,
                  suffixIcon: IconButton(
                      icon: isInvisible == true
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        isInvisible = !isInvisible;
                        setState(() {});
                      }),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
