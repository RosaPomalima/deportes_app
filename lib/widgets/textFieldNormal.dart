import 'package:flutter/material.dart';

class Textfieldnormal extends StatelessWidget {
  String txtlabel;
  String hint;

  TextEditingController controller;
  Textfieldnormal(
      {required this.controller, required this.txtlabel, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Text(txtlabel),
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
