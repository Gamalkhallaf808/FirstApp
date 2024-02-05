import 'package:flutter/material.dart';
import 'package:flutter_app_2/card.dart';
import 'package:flutter_app_2/core/settings_util.dart';
import 'package:flutter_app_2/models/cart_mobdel.dart';
import 'package:flutter_app_2/pages/navBar/categories_screen.dart';
import 'package:flutter_app_2/pages/navBar/main_screen.dart';
import 'package:flutter_app_2/pages/navBar/settings_screen.dart';
import 'package:flutter_app_2/service/cart_service.dart';
import 'package:flutter_app_2/widget/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool isLoading = true;
  List<Product> cartList = [];

  Future<void> getData() async {
    cartList = await CartService.getCartData();
    isLoading = false;
    setState(() {});
  }
  int pageIndex = 0;
  String phoneNumber = "";
  List<Widget> pages = [
    const MainScreen(),
    const CategoriesScreen(),
    const SettingScreen(),
  ];
  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> getPhoneNumber() async {
    phoneNumber = await SettingsUtil.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Text("User Name"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Phone: $phoneNumber")],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("Add product"),
                )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => myCart()),
                    );
                  },
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("cart"),
                )
                  ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  SettingsUtil.signOutFlow(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
