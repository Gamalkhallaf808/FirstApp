import 'package:flutter/material.dart';
import 'package:flutter_app_2/app_settings.dart';
import 'package:flutter_app_2/pages/home.dart';
import 'package:flutter_app_2/widget/app-button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignPage extends StatefulWidget {
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController phoneNumberControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Gamal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset("image/logo].png"),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: phoneNumberControllar,
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                onChanged: (val) {
                  phoneNumber = val;
                },
                validator: (val) {
                  String patt = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp reg = new RegExp(patt);
                  if (reg.hasMatch(val!)) {
                    return null;
                  } else {
                    return "Invalid Phone Number";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: passwordControllar,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                validator: (val) {
                  if (val!.length < 8) {
                    return "Invalid Password";
                  }
                },
              ),
            ),
            appButton(
              lable: "Login In",
              color: Colors.red,
              onTap: () async {
                if (_formkey.currentState!.validate()) {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString(
                      AppSettings.userPhone, phoneNumberControllar.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  passwordControllar.clear();
                }
              },
            ),
            Text("Forgot password? No yawa Tap me"),
            appButton(
              lable: "No account, sign up",
              color: Colors.blue,
              onTap: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

