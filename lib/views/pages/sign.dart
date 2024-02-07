import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/core/firebase_auth_util.dart';
import 'package:flutter_app_2/views/pages/home.dart';
import 'package:flutter_app_2/views/widget/app-button.dart';

class SignPage extends StatefulWidget {
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();
  bool isLoading = false;
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onChanged: (val) {
                  phoneNumber = val;
                },
                validator: (val) {
                  if (val!.isNotEmpty) {
                    return null;
                  } else {
                    return "Invalid Email";
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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : appButton(
                    lable: "Log in",
                    color: Colors.blue[300]!,
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        if (kDebugMode) {
                          print("Logged in");
                        }
                        isLoading = true;
                        setState(() {});
                        bool loginResult = await FirebaseAuthUtil.loginIn(
                            email: emailController.text,
                            password: passwordControllar.text);
                        if (loginResult) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          var snackBar = const SnackBar(
                            content: Text("Email or password is not correct"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        isLoading = false;
                        setState(() {});
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
