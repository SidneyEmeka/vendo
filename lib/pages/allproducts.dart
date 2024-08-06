import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vendo/models/productmodel.dart';
import 'package:vendo/pages/productpreview.dart';
import 'package:vendo/pages/products.dart';

import '../utils/productcard.dart';
import 'cart.dart';

class Allproducts extends StatefulWidget {
  const Allproducts({super.key});

  @override
  State<Allproducts> createState() => _AllproductsState();
}

class _AllproductsState extends State<Allproducts> {
  //bottomNavBar index
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To maintain scroll position we use indexed stack
      body: IndexedStack(
        index: selectedIndex,
        children: [Products(), Cart()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping), label: "Cart")
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.brown.shade900,
      ),
    );
  }
}
