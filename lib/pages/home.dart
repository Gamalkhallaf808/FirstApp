import 'package:flutter/material.dart';
import 'package:flutter_app_2/pages/navBar/categories_screen.dart';
import 'package:flutter_app_2/pages/navBar/main_screen.dart';
import 'package:flutter_app_2/pages/navBar/settings_screen.dart';
import 'package:flutter_app_2/pages/sign.dart';
import 'package:flutter_app_2/widget/app-button.dart';

// import 'package:shared_preferences/shared_preferences.dart';
class homePage extends StatefulWidget {
  // final String phoneNumber;
  const homePage({
    Key? key,
  }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoriesScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.white,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignPage()),);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.exit_to_app),
                  Text("Signout"),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(currentIndex: pageIndex,
      onTap: onNavBarTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categries"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ]),

      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: Text("Gamal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      // ),
//       body: Column(
//         children: [
//         Text(widget.phoneNumber, style: TextStyle(color: Colors.red),),
//           const Padding(
//             padding: EdgeInsets.only(top: 40),
//             child: Text("Is the number correct?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// ),
//           ),
//             Center(
//               child: appButton(
//                 lable: "Next",
//                 color: Colors.blue,
//                 onTap: () {
//                   print("gamal");
//                 },
//               ),
//             ),
//             appButton(
//               lable: "revision",
//               color: Colors.blue,
//               onTap: () {
//                 print("gamal");
//               },
//             ),
//         ],
//       ),
    );
  }
  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {
      
    });
  }
}
