import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelT;
  final Icon icon;
  final Stream bloc;
  const LoginTextField({Key? key, required this.controller, required this.labelT, required this.icon, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,20,20,30),
      child: StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon,
              hintText: 'enter a here',
              labelText: labelT,
              errorText: snapshot.hasError? snapshot.error.toString(): null,
              labelStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(),
            ),);
        }
      ),
    );
  }
}
