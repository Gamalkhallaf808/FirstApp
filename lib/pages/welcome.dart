import 'package:flutter/material.dart';
import 'package:flutter_app_2/widget/app-button.dart';

class welcomePagState extends StatefulWidget {
  final String phoneNumber;
  const welcomePagState({Key? key, required this.phoneNumber,}) : super(key: key);

  @override
  State<welcomePagState> createState() => _welcomePagStateState();
}

class _welcomePagStateState extends State<welcomePagState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gamal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
        Text(widget.phoneNumber, style: TextStyle(color: Colors.red),),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text("Is the number correct?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
          ),
            Center(
              child: appButton(
                lable: "Next",
                color: Colors.blue,
                onTap: () {
                  print("gamal");
                },
              ),
            ),
            appButton(
              lable: "revision",
              color: Colors.blue,
              onTap: () {
                print("gamal");
              },
            ),
        ],
      ),
    );
  }
}