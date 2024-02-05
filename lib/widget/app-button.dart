import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class appButton extends StatelessWidget {
  final String lable;
  final Color color;
  final void Function()? onTap;
  const appButton({
    Key? key,
    required this.lable,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
        ),
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: Text(
              lable,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
